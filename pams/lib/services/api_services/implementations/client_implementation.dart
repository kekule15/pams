import 'package:dio/dio.dart';
import 'package:pams/models/api_response_model.dart';
import 'package:pams/models/other_model/client_model.dart';
import 'package:pams/services/api_services/interface/client_interface.dart';
import 'package:pams/utils/shared_pref_manager.dart';

class ClientImplementation extends ClientsInterface {
  @override
  Future<APIResponse<dynamic>> getAllClients() async {
    String token = await Prefs.instance.getStringValue('token');
    List<ReturnObject> clients = [];

    // or new Dio with a BaseOptions instance.
    var options = BaseOptions(
      baseUrl: 'http://sethlab-001-site1.itempurl.com',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    Dio dio = Dio(options);
    Response response = await dio.get(
      '/api/v1/Client/GetAllClient',
      options: Options(method: 'GET'),
    );
    final  statusCode = response.statusCode;
    if (statusCode == 200) {
      var jsonData = response.data["returnObject"] as List;
      print(jsonData);

      for (var i = 0; i < jsonData.length; i++) {
        var client_detail = ReturnObject.fromJson(jsonData[i]);
        clients.add(client_detail);
        print(client_detail);
      }

      // var detail = {
      //   "all_clients": clients,
      //   //"client_unique_id": jsonData[2]["id"],
      // };
      return APIResponse(data: clients, error: false, errorMessage: '');
    }
    return APIResponse(data: {
      "all_clients": [],
      //"client_unique_id": '',
    }, error: true, errorMessage: '');
  }
}
