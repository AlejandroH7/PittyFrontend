import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventoListPage extends StatelessWidget {
  const EventoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/menu'),
        ),
        title: const Text('Lista de Eventos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/eventos/crear'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Evento ${index + 1}'),
            onTap: () => context.go('/eventos/${index + 1}'),
          );
        },
      ),
    );
  }
}
