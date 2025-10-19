
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pitty_frontend/features/pedido/presentation/widgets/pedido_form.dart';

class PedidoCreatePage extends StatelessWidget {
  const PedidoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Crear Pedido'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: PedidoForm(),
      ),
    );
  }
}
