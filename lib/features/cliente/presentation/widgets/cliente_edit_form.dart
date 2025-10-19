
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClienteEditForm extends StatefulWidget {
  final String clientId;

  const ClienteEditForm({super.key, required this.clientId});

  @override
  State<ClienteEditForm> createState() => _ClienteEditFormState();
}

class _ClienteEditFormState extends State<ClienteEditForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nombreController;
  late final TextEditingController _telefonoController;
  late final TextEditingController _notasController;

  @override
  void initState() {
    super.initState();
    // Simulate fetching existing client data
    _nombreController = TextEditingController(text: 'Cliente ${widget.clientId} Nombre');
    _telefonoController = TextEditingController(text: '123-456-7890');
    _notasController = TextEditingController(text: 'Notas existentes para cliente ${widget.clientId}');
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _telefonoController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nombreController,
            decoration: const InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un nombre';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _telefonoController,
            decoration: const InputDecoration(labelText: 'Teléfono'),
          ),
          TextFormField(
            controller: _notasController,
            decoration: const InputDecoration(labelText: 'Notas'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Lógica para guardar los cambios del cliente
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Guardando cambios para cliente ${widget.clientId}')),
                );
                context.pop(); // Go back after saving
              }
            },
            child: const Text('Guardar Cambios'),
          ),
        ],
      ),
    );
  }
}
