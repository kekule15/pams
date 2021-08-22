import 'package:pams/services/api_services/implementations/client_implementation.dart';

class ClientsRepository {
  static getAllClientlist() => ClientImplementation().getAllClients();

//get samplings for a client
  static getAllClientsSamplings(String client_id) =>
      ClientImplementation().getAllClientsSamplings(client_id);

      //get testTemplates for a sample
    static getTestTemplates(String sample_id) =>
      ClientImplementation().getTestTemplates(sample_id);  

}
