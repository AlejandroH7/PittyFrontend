import 'package:pitty_frontend/data/clients/client_lookup.dart';
import 'package:pitty_frontend/data/clients/client_summary.dart';

class ClientLookupMock implements ClientLookup {
  final List<ClientSummary> _mockClients = const [
    ClientSummary(id: 1, nombre: 'Juan Perez', codigo: 'JP001'),
    ClientSummary(id: 2, nombre: 'Maria Garcia', codigo: 'MG002'),
    ClientSummary(id: 3, nombre: 'Carlos Lopez', codigo: 'CL003'),
    ClientSummary(id: 4, nombre: 'Ana Martinez', codigo: 'AM004'),
    ClientSummary(id: 5, nombre: 'Pedro Sanchez', codigo: 'PS005'),
  ];

  @override
  Future<List<ClientSummary>> search(String query) async {
    await Future.delayed(
        const Duration(milliseconds: 300)); // Simulate network delay
    if (query.isEmpty) {
      return [];
    }
    return _mockClients
        .where((client) =>
            client.nombre.toLowerCase().contains(query.toLowerCase()) ||
            (client.codigo?.toLowerCase().contains(query.toLowerCase()) ??
                false))
        .toList();
  }
}
