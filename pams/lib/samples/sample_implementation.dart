import 'package:shared_preferences/shared_preferences.dart';


import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SampleImplementation {
  Future<Map<String, dynamic>?> getClientsTemplates(var clientId) async {
    var url = 'http://sethlab-001-site1.itempurl.com/api/v1/Sample/$clientId/SampleTemplates';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var api = prefs.getString('apiToken');
    final response = await http
        .get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $api',
    });

    final int statusCode = response.statusCode;
    print("my code ${response.body}");
    return Map.from(jsonDecode(response.body));
  }
}