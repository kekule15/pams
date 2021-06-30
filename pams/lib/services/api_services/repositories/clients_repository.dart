import 'package:pams/services/api_services/implementations/client_implementation.dart';

class ClientsRepository {
  static getAllClients() =>
      ClientImplementation().getAllClients();
}
