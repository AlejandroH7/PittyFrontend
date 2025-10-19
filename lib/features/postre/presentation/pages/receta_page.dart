
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecetaPage extends StatelessWidget {
  final String id;

  const RecetaPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text('Receta del Postre $id'),
      ),
      body: Center(
        child: Text('Receta del postre $id'),
      ),
    );
  }
}
