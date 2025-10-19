
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostreEditForm extends StatefulWidget {
  final String postreId;

  const PostreEditForm({super.key, required this.postreId});

  @override
  State<PostreEditForm> createState() => _PostreEditFormState();
}

class _PostreEditFormState extends State<PostreEditForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nombreController;
  late final TextEditingController _precioController;
  late final TextEditingController _porcionesController;
  late bool _activo;

  @override
  void initState() {
    super.initState();
    // Simulate fetching existing postre data
    _nombreController = TextEditingController(text: 'Postre ${widget.postreId} Nombre');
    _precioController = TextEditingController(text: '25.50');
    _porcionesController = TextEditingController(text: '8');
    _activo = true;
  }

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
                // Lógica para guardar los cambios del postre
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Guardando cambios para postre ${widget.postreId}')),
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
