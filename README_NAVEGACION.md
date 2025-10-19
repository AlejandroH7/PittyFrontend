
# Instrucciones de Ejecución (Fase 1: Navegación)

Este es un prototipo de navegación para la aplicación Pitty. En esta fase, la aplicación no se conecta a ningún backend. Todas las vistas son esqueletos y la navegación es funcional.

## Requisitos

- Flutter SDK instalado
- Un emulador de Android o iOS, o un dispositivo físico

## Cómo ejecutar

1. Clona este repositorio.
2. Abre una terminal en el directorio raíz del proyecto.
3. Ejecuta `flutter pub get` para instalar las dependencias.
4. Ejecuta `flutter run` para iniciar la aplicación.

## Mapeo de Pantallas a Capacidades del Backend

Cada pantalla de la aplicación corresponde a una funcionalidad existente en el backend de Pitty. A continuación se detalla el mapeo:

- **Clientes**
  - `ClienteListPage`: Corresponde a `GET /api/clientes`.
  - `ClienteDetailPage`: Corresponde a `GET /api/clientes/{id}`.
  - `ClienteCreatePage`: Corresponde a `POST /api/clientes`.
  - `ClienteEditPage`: Corresponde a `PUT /api/clientes/{id}`.

- **Postres**
  - `PostreListPage`: Corresponde a `GET /api/postres`.
  - `PostreDetailPage`: Corresponde a `GET /api/postres/{id}`.
  - `PostreCreatePage`: Corresponde a `POST /api/postres`.
  - `PostreEditPage`: Corresponde a `PUT /api/postres/{id}`.
  - `RecetaPage`: Corresponde a `GET /api/postres/{postreId}/receta`.

- **Ingredientes**
  - `IngredienteListPage`: Corresponde a `GET /api/ingredientes`.
  - `IngredienteDetailPage`: Corresponde a `GET /api/ingredientes/{id}`.
  - `IngredienteCreatePage`: Corresponde a `POST /api/ingredientes`.
  - `IngredienteEditPage`: Corresponde a `PUT /api/ingredientes/{id}`.

- **Pedidos**
  - `PedidoListPage`: Corresponde a `GET /api/pedidos`.
  - `PedidoDetailPage`: Corresponde a `GET /api/pedidos/{id}`.
  - `PedidoCreatePage`: Corresponde a `POST /api/pedidos`.
  - `PedidoEditPage`: Corresponde a `PUT /api/pedidos/{id}/estado`.

- **Eventos**
  - `EventoListPage`: Corresponde a `GET /api/eventos`.
  - `EventoDetailPage`: Corresponde a `GET /api/eventos/{id}`.
  - `EventoCreatePage`: Corresponde a `POST /api/eventos`.
  - `EventoEditPage`: Corresponde a `PUT /api/eventos/{id}`.
