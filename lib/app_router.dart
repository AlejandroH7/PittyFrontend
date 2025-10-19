import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pitty_frontend/features/cliente/presentation/pages/cliente_create_page.dart';
import 'package:pitty_frontend/features/cliente/presentation/pages/cliente_detail_page.dart';
import 'package:pitty_frontend/features/cliente/presentation/pages/cliente_edit_page.dart';
import 'package:pitty_frontend/features/cliente/presentation/pages/cliente_list_page.dart';
import 'package:pitty_frontend/features/evento/presentation/pages/evento_create_page.dart';
import 'package:pitty_frontend/features/evento/presentation/pages/evento_detail_page.dart';
import 'package:pitty_frontend/features/evento/presentation/pages/evento_edit_page.dart';
import 'package:pitty_frontend/features/evento/presentation/pages/evento_list_page.dart';
import 'package:pitty_frontend/features/ingrediente/presentation/pages/ingrediente_create_page.dart';
import 'package:pitty_frontend/features/ingrediente/presentation/pages/ingrediente_detail_page.dart';
import 'package:pitty_frontend/features/ingrediente/presentation/pages/ingrediente_edit_page.dart';
import 'package:pitty_frontend/features/ingrediente/presentation/pages/ingrediente_list_page.dart';
import 'package:pitty_frontend/features/pedido/presentation/pages/pedido_create_page.dart';
import 'package:pitty_frontend/features/pedido/presentation/pages/pedido_detail_page.dart';
import 'package:pitty_frontend/features/pedido/presentation/pages/pedido_edit_page.dart';
import 'package:pitty_frontend/features/pedido/presentation/pages/pedido_list_page.dart';
import 'package:pitty_frontend/features/postre/presentation/pages/postre_create_page.dart';
import 'package:pitty_frontend/features/postre/presentation/pages/postre_detail_page.dart';
import 'package:pitty_frontend/features/postre/presentation/pages/postre_edit_page.dart';
import 'package:pitty_frontend/features/postre/presentation/pages/postre_list_page.dart';
import 'package:pitty_frontend/features/postre/presentation/pages/receta_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/menu',
      name: 'menu',
      builder: (context, state) => const MenuPage(),
    ),
    GoRoute(
      path: '/clientes',
      name: 'clientes',
      builder: (context, state) => const ClienteListPage(),
      routes: [
        GoRoute(
          path: 'crear',
          name: 'clientes_crear',
          builder: (context, state) => const ClienteCreatePage(),
        ),
        GoRoute(
          path: ':id',
          name: 'clientes_detail',
          builder: (context, state) =>
              ClienteDetailPage(id: state.pathParameters['id']!),
          routes: [
            GoRoute(
              path: 'editar',
              name: 'clientes_editar',
              builder: (context, state) =>
                  ClienteEditPage(id: state.pathParameters['id']!),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/postres',
      name: 'postres',
      builder: (context, state) => const PostreListPage(),
      routes: [
        GoRoute(
          path: 'crear',
          name: 'postres_crear',
          builder: (context, state) => const PostreCreatePage(),
        ),
        GoRoute(
          path: ':id',
          name: 'postres_detail',
          builder: (context, state) =>
              PostreDetailPage(id: state.pathParameters['id']!),
          routes: [
            GoRoute(
              path: 'editar',
              name: 'postres_editar',
              builder: (context, state) =>
                  PostreEditPage(id: state.pathParameters['id']!),
            ),
            GoRoute(
              path: 'receta',
              name: 'postres_receta',
              builder: (context, state) =>
                  RecetaPage(id: state.pathParameters['id']!),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/ingredientes',
      name: 'ingredientes',
      builder: (context, state) => const IngredienteListPage(),
      routes: [
        GoRoute(
          path: 'crear',
          name: 'ingredientes_crear',
          builder: (context, state) => const IngredienteCreatePage(),
        ),
        GoRoute(
          path: ':id',
          name: 'ingredientes_detail',
          builder: (context, state) =>
              IngredienteDetailPage(id: state.pathParameters['id']!),
          routes: [
            GoRoute(
              path: 'editar',
              name: 'ingredientes_editar',
              builder: (context, state) =>
                  IngredienteEditPage(id: state.pathParameters['id']!),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/pedidos',
      name: 'pedidos',
      builder: (context, state) => const PedidoListPage(),
      routes: [
        GoRoute(
          path: 'crear',
          name: 'pedidos_crear',
          builder: (context, state) => const PedidoCreatePage(),
        ),
        GoRoute(
          path: ':id',
          name: 'pedidos_detail',
          builder: (context, state) =>
              PedidoDetailPage(id: state.pathParameters['id']!),
          routes: [
            GoRoute(
              path: 'editar',
              name: 'pedidos_editar',
              builder: (context, state) =>
                  PedidoEditPage(id: state.pathParameters['id']!),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/eventos',
      name: 'eventos',
      builder: (context, state) => const EventoListPage(),
      routes: [
        GoRoute(
          path: 'crear',
          name: 'eventos_crear',
          builder: (context, state) => const EventoCreatePage(),
        ),
        GoRoute(
          path: ':id',
          name: 'eventos_detail',
          builder: (context, state) =>
              EventoDetailPage(id: state.pathParameters['id']!),
          routes: [
            GoRoute(
              path: 'editar',
              name: 'eventos_editar',
              builder: (context, state) =>
                  EventoEditPage(id: state.pathParameters['id']!),
            ),
          ],
        ),
      ],
    ),
  ],
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a Pitty'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pitty_logo.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/menu'),
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Clientes'),
            onTap: () => context.go('/clientes'),
          ),
          ListTile(
            title: const Text('Postres'),
            onTap: () => context.go('/postres'),
          ),
          ListTile(
            title: const Text('Ingredientes'),
            onTap: () => context.go('/ingredientes'),
          ),
          ListTile(
            title: const Text('Pedidos'),
            onTap: () => context.go('/pedidos'),
          ),
          ListTile(
            title: const Text('Eventos'),
            onTap: () => context.go('/eventos'),
          ),
        ],
      ),
    );
  }
}
