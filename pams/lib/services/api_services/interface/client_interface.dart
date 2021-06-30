import 'package:pams/models/api_response_model.dart';

abstract class ClientsInterface {
  //Get all items in clients from the server
  Future<APIResponse<dynamic>> getAllClients();
}
