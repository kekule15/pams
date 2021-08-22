import 'package:dio/dio.dart';
import 'package:pams/models/api_response_model.dart';
import 'package:pams/models/other_model/client_model.dart';
import 'package:pams/models/other_model/client_sample_model.dart';
import 'package:pams/models/other_model/test_template_model.dart';
import 'package:pams/services/api_services/interface/client_interface.dart';
import 'package:pams/utils/shared_pref_manager.dart';

class ClientImplementation implements ClientsInterface {
  @override
  Future<ClientModel> getAllClients() async {
    String token = await Prefs.instance.getStringValue('token');

    // or new Dio with a BaseOptions instance.
    var options = BaseOptions(
      baseUrl: 'http://sethlab-001-site1.itempurl.com',
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    Dio dio = Dio(options);
    final response = await dio.get(
      '/api/v1/Client/GetAllClient',
      options: Options(method: 'GET'),
    );
    if (response.statusCode == 200) {
      var body = response.data;
      ClientModel data = ClientModel.fromJson(body);
      print(data.toString());
      return data;
    } else {
      throw Exception('Failed to load Clients');
    }
  }


//Get samples for a client using the id
  Future <ClientSampleModel>  getAllClientsSamplings( String client_id) async {
    String token = await Prefs.instance.getStringValue('token');
      // or new Dio with a BaseOptions instance.
    var options = BaseOptions(
      baseUrl: 'http://sethlab-001-site1.itempurl.com',
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
     Dio dio = Dio(options);
    final response = await dio.get(
      '/api/v1/Sample/clientTemplates' + '/$client_id',
      options: Options(method: 'GET'),
    );
    if (response.statusCode == 200) {
      var body = response.data;
      ClientSampleModel data = ClientSampleModel.fromJson(body);
      print(data.toString());
      return data;
    } else {
      throw Exception('Failed to load Clients');
    }
  }

  //Get testTemplates for a sample using the id
  Future<Template> getTestTemplates(String sample_id) async{
 
  String token = await Prefs.instance.getStringValue('token');
      // or new Dio with a BaseOptions instance.
    var options = BaseOptions(
      baseUrl: 'http://sethlab-001-site1.itempurl.com',
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
     Dio dio = Dio(options);
    final response = await dio.get(
      '/api/v1/Sample/sampleTemplate' + '/$sample_id',
      options: Options(method: 'GET'),
    );
    if (response.statusCode == 200) {
      var body = response.data;
      Template data = Template.fromJson(body);
      print(data.toString());
      return data;
    } else {
      throw Exception('Failed to load Clients');
    }
  }
}
