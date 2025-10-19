import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventoEditForm extends StatefulWidget {
  final String eventoId;

  const EventoEditForm({super.key, required this.eventoId});

  @override
  State<EventoEditForm> createState() => _EventoEditFormState();
}

class _EventoEditFormState extends State<EventoEditForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _tituloController;
  late final TextEditingController _lugarController;
  late final TextEditingController _pedidoIdController;
  late final TextEditingController _notasController;
  DateTime? _fechaHora;

  @override
  void initState() {
    super.initState();
    // Simulate fetching existing evento data
    _tituloController =
        TextEditingController(text: 'Evento ${widget.eventoId} Título');
    _lugarController = TextEditingController(text: 'Lugar del Evento');
    _pedidoIdController = TextEditingController(text: '1'); // Placeholder
    _notasController = TextEditingController(
        text: 'Notas existentes para evento ${widget.eventoId}');
    _fechaHora = DateTime.now().add(const Duration(days: 30)); // Placeholder
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _lugarController.dispose();
    _pedidoIdController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaHora ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _fechaHora) {
      if (!context.mounted) return;
      setState(() {
        _fechaHora = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_fechaHora ?? DateTime.now()),
    );
    if (picked != null) {
      if (!context.mounted) return;
      setState(() {
        _fechaHora = DateTime(
          (_fechaHora ?? DateTime.now()).year,
          (_fechaHora ?? DateTime.now()).month,
          (_fechaHora ?? DateTime.now()).day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Título'),
            maxLength: 150,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un título';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _lugarController,
            decoration: const InputDecoration(labelText: 'Lugar'),
            maxLength: 150,
          ),
          ListTile(
            title: Text(_fechaHora == null
                ? 'Seleccionar Fecha y Hora'
                : 'Fecha y Hora: ${_fechaHora!.toLocal().toString().split('.')[0]}'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              await _selectDate(context);
              if (!context.mounted) return;
              if (_fechaHora != null) {
                await _selectTime(context);
                if (!context.mounted) return;
              }
            },
          ),
          TextFormField(
            controller: _pedidoIdController,
            decoration:
                const InputDecoration(labelText: 'ID Pedido (opcional)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value != null &&
                  value.isNotEmpty &&
                  int.tryParse(value) == null) {
                return 'Por favor ingrese un número válido';
              }
              return null;
            },
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
                if (_fechaHora == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor seleccione una fecha y hora')),
                  );
                  return;
                }
                // Lógica para guardar los cambios del evento
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Guardando cambios para evento ${widget.eventoId}')),
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
