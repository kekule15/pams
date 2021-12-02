import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SampleImplementation {
  Future<Map<String, dynamic>?> getClientsTemplates(var clientId) async {
    var url =
        'http://sethlab-001-site1.itempurl.com/api/v1/Sample/$clientId/SampleTemplates';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var api = prefs.getString('apiToken');
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $api',
    });

    final int statusCode = response.statusCode;
    //print("my code ${response.body}");
    return Map.from(jsonDecode(response.body));
  }

  //submit test result to the database
  Future<Map<String, dynamic>?> SubmitTest(var clientId) async {
    var url =
        'http://sethlab-001-site1.itempurl.com/api/v1/Sample/sampling';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var api = prefs.getString('apiToken');
    var body = {
      "staffName": "string",
      "staffId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "samplingTime": DateTime.now(),
      "samplingDate": DateTime.now(),
      "clientId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "gpsLong": 0,
      "gpsLat": 0,
      "picture": "string",
      "microBiologicals": [
        {
          "microbial_Group": "string",
          "result": "string",
          "unit": "string",
          "limit": "string",
          "test_Method": "string"
        }
      ],
      "physicoChemicals": [
        {
          "test_Performed_And_Unit": "string",
          "result": "string",
          "uc": "string",
          "limit": "string",
          "test_Method": "string",
          "type": 0
        }
      ]
    };
    final response = await http.post(Uri.parse(url), body: body, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $api',
    });

    final int statusCode = response.statusCode;
    //print("my code ${response.body}");
    return Map.from(jsonDecode(response.body));
  }
}
