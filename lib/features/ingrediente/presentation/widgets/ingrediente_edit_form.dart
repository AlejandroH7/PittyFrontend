
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IngredienteEditForm extends StatefulWidget {
  final String ingredienteId;

  const IngredienteEditForm({super.key, required this.ingredienteId});

  @override
  State<IngredienteEditForm> createState() => _IngredienteEditFormState();
}

class _IngredienteEditFormState extends State<IngredienteEditForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nombreController;
  late final TextEditingController _unidadController;
  late final TextEditingController _stockMinimoController;
  late final TextEditingController _stockActualController;
  late bool _activo;

  @override
  void initState() {
    super.initState();
    // Simulate fetching existing ingrediente data
    _nombreController = TextEditingController(text: 'Ingrediente ${widget.ingredienteId} Nombre');
    _unidadController = TextEditingController(text: 'kg');
    _stockMinimoController = TextEditingController(text: '5.0');
    _stockActualController = TextEditingController(text: '10.0');
    _activo = true;
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _unidadController.dispose();
    _stockMinimoController.dispose();
    _stockActualController.dispose();
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
            controller: _unidadController,
            decoration: const InputDecoration(labelText: 'Unidad'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese una unidad';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _stockMinimoController,
            decoration: const InputDecoration(labelText: 'Stock Mínimo'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el stock mínimo';
              }
              if (double.tryParse(value) == null || double.parse(value) < 0) {
                return 'Por favor ingrese un número válido para el stock mínimo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _stockActualController,
            decoration: const InputDecoration(labelText: 'Stock Actual'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el stock actual';
              }
              if (double.tryParse(value) == null || double.parse(value) < 0) {
                return 'Por favor ingrese un número válido para el stock actual';
              }
              return null;
            },
          ),
          SwitchListTile(
            title: const Text('Activo'),
            value: _activo,
            onChanged: (value) {
              setState(() {
                _activo = value;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Lógica para guardar los cambios del ingrediente
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Guardando cambios para ingrediente ${widget.ingredienteId}')),
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
