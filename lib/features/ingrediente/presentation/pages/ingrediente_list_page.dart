
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IngredienteListPage extends StatelessWidget {
  const IngredienteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/menu'),
        ),
        title: const Text('Lista de Ingredientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/ingredientes/crear'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Ingrediente ${index + 1}'),
            onTap: () => context.go('/ingredientes/${index + 1}'),
          );
        },
      ),
    );
  }
}
