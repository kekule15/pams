import 'package:pams/models/api_response_model.dart';
import 'package:pams/models/other_model/client_model.dart';
import 'package:pams/models/other_model/client_sample_model.dart';

abstract class ClientsInterface {
  //Get all items in clients from the server
  Future<ClientModel> getAllClients();

  //Get all client's samples from the server

  Future<ClientSampleModel> getAllClientsSamplings(String client_id);
}
