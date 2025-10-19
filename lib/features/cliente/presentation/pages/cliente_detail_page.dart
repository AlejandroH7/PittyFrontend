import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClienteDetailPage extends StatelessWidget {
  final String id;

  const ClienteDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text('Detalle de Cliente $id'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.go('/clientes/$id/editar'),
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
                        '¿Estás seguro de que quieres eliminar el cliente $id?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Eliminando cliente $id')),
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
        child: Text('Detalle de Cliente $id'),
      ),
    );
  }
}
