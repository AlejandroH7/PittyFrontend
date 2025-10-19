import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventoForm extends StatefulWidget {
  const EventoForm({super.key});

  @override
  State<EventoForm> createState() => _EventoFormState();
}

class _EventoFormState extends State<EventoForm> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _lugarController = TextEditingController();
  final _pedidoIdController = TextEditingController();
  final _notasController = TextEditingController();
  DateTime? _fechaHora;

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
                // Lógica para guardar el evento
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Simulando guardar evento')),
                );
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
