import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostreForm extends StatefulWidget {
  const PostreForm({super.key});

  @override
  State<PostreForm> createState() => _PostreFormState();
}

class _PostreFormState extends State<PostreForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _porcionesController = TextEditingController();
  bool _activo = true;

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    _porcionesController.dispose();
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
            controller: _precioController,
            decoration: const InputDecoration(labelText: 'Precio'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un precio';
              }
              if (double.tryParse(value) == null || double.parse(value) <= 0) {
                return 'Por favor ingrese un precio válido';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _porcionesController,
            decoration: const InputDecoration(labelText: 'Porciones'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la cantidad de porciones';
              }
              if (int.tryParse(value) == null || int.parse(value) < 1) {
                return 'Por favor ingrese un número válido de porciones';
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
                // Lógica para guardar el postre
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Simulando guardar postre')),
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