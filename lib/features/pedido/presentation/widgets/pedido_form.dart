import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pitty_frontend/data/clients/client_lookup.dart';
import 'package:pitty_frontend/data/clients/client_lookup_mock.dart';
import 'package:pitty_frontend/data/clients/client_summary.dart';

class PedidoForm extends StatefulWidget {
  const PedidoForm({super.key});

  @override
  State<PedidoForm> createState() => _PedidoFormState();
}

class _PedidoFormState extends State<PedidoForm> {
  final _formKey = GlobalKey<FormState>();
  final _notasController = TextEditingController();
  final _clienteSearchController = TextEditingController();
  final ClientLookup _clientLookup = ClientLookupMock();

  List<ClientSummary> _foundClients = [];
  int? _selectedClientId;
  String? _selectedClientName;
  bool _clientNotFound = false;

  DateTime? _fechaEntrega;

  @override
  void initState() {
    super.initState();
    _clienteSearchController.addListener(_onClientSearchChanged);
  }

  @override
  void dispose() {
    _clienteSearchController.removeListener(_onClientSearchChanged);
    _clienteSearchController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  void _onClientSearchChanged() async {
    final query = _clienteSearchController.text;
    if (query.isEmpty) {
      setState(() {
        _foundClients = [];
        _clientNotFound = false;
      });
      return;
    }

    final results = await _clientLookup.search(query);
    if (!mounted)
      return; // Check if the widget is still mounted after async operation

    setState(() {
      _foundClients = results;
      _clientNotFound = results.isEmpty;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaEntrega ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _fechaEntrega) {
      if (!context.mounted) return;
      setState(() {
        _fechaEntrega = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Client Search UI
          TextFormField(
            controller: _clienteSearchController,
            decoration: const InputDecoration(
              labelText: 'Buscar Cliente',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          if (_selectedClientName != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Chip(
                label: Text(
                    'Cliente seleccionado: $_selectedClientName (ID: $_selectedClientId)'),
                onDeleted: () {
                  setState(() {
                    _selectedClientId = null;
                    _selectedClientName = null;
                    _clienteSearchController.clear();
                    _foundClients = []; // Clear results after selection
                    _clientNotFound = false;
                  });
                },
              ),
            ),
          if (_foundClients.isNotEmpty && _selectedClientName == null)
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: _foundClients.length,
                itemBuilder: (context, index) {
                  final client = _foundClients[index];
                  return ListTile(
                    title: Text(client.nombre),
                    subtitle:
                        client.codigo != null ? Text(client.codigo!) : null,
                    onTap: () {
                      setState(() {
                        _selectedClientId = client.id;
                        _selectedClientName = client.nombre;
                        _foundClients = []; // Clear results after selection
                        _clienteSearchController.text = client
                            .nombre; // Set text field to selected client's name
                      });
                    },
                  );
                },
              ),
            ),
          if (_clientNotFound && _selectedClientName == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  const Text('Cliente no encontrado.'),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/clientes/crear');
                    },
                    child: const Text('Crear Cliente'),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(_fechaEntrega == null
                ? 'Seleccionar Fecha de Entrega'
                : 'Fecha de Entrega: ${_fechaEntrega!.toLocal().toString().split(' ')[0]}'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => _selectDate(context),
          ),
          TextFormField(
            controller: _notasController,
            decoration: const InputDecoration(labelText: 'Notas'),
            maxLength: 500,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (_fechaEntrega == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Por favor seleccione una fecha de entrega')),
                  );
                  return;
                }
                if (_selectedClientId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Por favor seleccione o cree un cliente')),
                  );
                  return;
                }
                // Simulate payload creation and display
                final payload = {
                  "cliente_id": _selectedClientId,
                  "fechaEntrega": _fechaEntrega!.toIso8601String(),
                  "notas": _notasController.text,
                  "items": [] // Placeholder for items
                };
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payload a enviar: $payload')),
                );
                debugPrint('Payload a enviar: $payload');
                context.pop(); // Go back after saving
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
