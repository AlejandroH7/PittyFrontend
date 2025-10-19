import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IngredienteForm extends StatefulWidget {
  const IngredienteForm({super.key});

  @override
  State<IngredienteForm> createState() => _IngredienteFormState();
}

class _IngredienteFormState extends State<IngredienteForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _unidadController = TextEditingController();
  final _stockMinimoController = TextEditingController();
  final _stockActualController = TextEditingController();
  bool _activo = true;

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
                // Lógica para guardar el ingrediente
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Simulando guardar ingrediente')),
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
