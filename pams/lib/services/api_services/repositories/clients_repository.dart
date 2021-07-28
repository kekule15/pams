import 'package:pams/services/api_services/implementations/client_implementation.dart';

class ClientsRepository {
  static getAllClientlist() => ClientImplementation().getAllClients();

  static getAllClientsSamplings(String client_id) =>
      ClientImplementation().getAllClientsSamplings(client_id);
}
