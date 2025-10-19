import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostreDetailPage extends StatelessWidget {
  final String id;

  const PostreDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text('Detalle de Postre $id'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.go('/postres/$id/editar'),
          ),
          IconButton(
            icon: const Icon(Icons.receipt),
            onPressed: () => context.go('/postres/$id/receta'),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirmar Eliminación'),
                    content: Text(
                        '¿Estás seguro de que quieres eliminar el postre $id?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Eliminando postre $id')),
                          );
                          context
                              .pop(); // Go back to list after simulated deletion
                        },
                        child: const Text('Eliminar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Detalle de Postre $id'),
      ),
    );
  }
}
