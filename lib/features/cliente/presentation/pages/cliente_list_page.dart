
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClienteListPage extends StatelessWidget {
  const ClienteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/menu'),
        ),
        title: const Text('Lista de Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/clientes/crear'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Cliente ${index + 1}'),
            onTap: () => context.go('/clientes/${index + 1}'),
          );
        },
      ),
    );
  }
}
