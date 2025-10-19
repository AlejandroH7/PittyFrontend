
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PedidoListPage extends StatelessWidget {
  const PedidoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/menu'),
        ),
        title: const Text('Lista de Pedidos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/pedidos/crear'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Pedido ${index + 1}'),
            onTap: () => context.go('/pedidos/${index + 1}'),
          );
        },
      ),
    );
  }
}
