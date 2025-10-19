import 'package:pitty_frontend/data/clients/client_summary.dart';

abstract class ClientLookup {
  Future<List<ClientSummary>> search(String query);
}
