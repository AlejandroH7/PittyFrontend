import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pitty_frontend/features/postre/presentation/widgets/postre_edit_form.dart';

class PostreEditPage extends StatelessWidget {
  final String id;

  const PostreEditPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text('Editar Postre $id'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PostreEditForm(postreId: id),
      ),
    );
  }
}
