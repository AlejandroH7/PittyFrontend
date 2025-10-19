
| Ruta | Nombre | Propósito | Entidad/Funcionalidad | Fuente en backend (archivo y/o endpoint) |
| :--- | :--- | :--- | :--- | :--- |
| `/` | `home` | Pantalla inicial | Aplicación | N/A |
| `/dashboard` | `dashboard` | Menú principal | Aplicación | N/A |
| `/clientes` | `clientes` | Listar clientes | Cliente | `GET /api/clientes` (`ClienteController.java`) |
| `/clientes/crear` | `clientes_crear` | Crear un nuevo cliente | Cliente | `POST /api/clientes` (`ClienteController.java`) |
| `/clientes/:id` | `clientes_detail` | Ver detalles de un cliente | Cliente | `GET /api/clientes/{id}` (`ClienteController.java`) |
| `/clientes/:id/editar` | `clientes_editar` | Editar un cliente | Cliente | `PUT /api/clientes/{id}` (`ClienteController.java`) |
| `/postres` | `postres` | Listar postres | Postre | `GET /api/postres` (`PostreController.java`) |
| `/postres/crear` | `postres_crear` | Crear un nuevo postre | Postre | `POST /api/postres` (`PostreController.java`) |
| `/postres/:id` | `postres_detail` | Ver detalles de un postre | Postre | `GET /api/postres/{id}` (`PostreController.java`) |
| `/postres/:id/editar` | `postres_editar` | Editar un postre | Postre | `PUT /api/postres/{id}` (`PostreController.java`) |
| `/postres/:id/receta` | `postres_receta` | Ver la receta de un postre | Postre | `GET /api/postres/{postreId}/receta` (`RecetaController.java`) |
| `/ingredientes` | `ingredientes` | Listar ingredientes | Ingrediente | `GET /api/ingredientes` (`IngredienteController.java`) |
| `/ingredientes/crear` | `ingredientes_crear` | Crear un nuevo ingrediente | Ingrediente | `POST /api/ingredientes` (`IngredienteController.java`) |
| `/ingredientes/:id` | `ingredientes_detail` | Ver detalles de un ingrediente | Ingrediente | `GET /api/ingredientes/{id}` (`IngredienteController.java`) |
| `/ingredientes/:id/editar` | `ingredientes_editar` | Editar un ingrediente | Ingrediente | `PUT /api/ingredientes/{id}` (`IngredienteController.java`) |
| `/pedidos` | `pedidos` | Listar pedidos | Pedido | `GET /api/pedidos` (`PedidoController.java`) |
| `/pedidos/crear` | `pedidos_crear` | Crear un nuevo pedido | Pedido | `POST /api/pedidos` (`PedidoController.java`) |
| `/pedidos/:id` | `pedidos_detail` | Ver detalles de un pedido | Pedido | `GET /api/pedidos/{id}` (`PedidoController.java`) |
| `/pedidos/:id/editar` | `pedidos_editar` | Editar un pedido | Pedido | `PUT /api/pedidos/{id}/estado` (`PedidoController.java`) |
| `/eventos` | `eventos` | Listar eventos | Evento | `GET /api/eventos` (`EventoController.java`) |
| `/eventos/crear` | `eventos_crear` | Crear un nuevo evento | Evento | `POST /api/eventos` (`EventoController.java`) |
| `/eventos/:id` | `eventos_detail` | Ver detalles de un evento | Evento | `GET /api/eventos/{id}` (`EventoController.java`) |
| `/eventos/:id/editar` | `eventos_editar` | Editar un evento | Evento | `PUT /api/eventos/{id}` (`EventoController.java`) |
