
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostreListPage extends StatelessWidget {
  const PostreListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/menu'),
        ),
        title: const Text('Lista de Postres'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/postres/crear'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Postre ${index + 1}'),
            onTap: () => context.go('/postres/${index + 1}'),
          );
        },
      ),
    );
  }
}
