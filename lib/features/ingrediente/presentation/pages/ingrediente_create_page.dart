import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pitty_frontend/features/ingrediente/presentation/widgets/ingrediente_form.dart';

class IngredienteCreatePage extends StatelessWidget {
  const IngredienteCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Crear Ingrediente'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: IngredienteForm(),
      ),
    );
  }
}
