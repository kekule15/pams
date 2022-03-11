import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pams/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DPRImplementation {
  // get client location
  Future<Map<String, dynamic>?> getDPRTemplates(int? locationId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('apiToken');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Constants.base_url +
        "/FieldScientistAnalysisDPR/get-dpr-template?LocationId=$locationId";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: requestHeaders,
      );
      // SHARED
      return jsonDecode(response.body);
    } catch (e) {}
  }

// run a test for each template
  Future<Map<String, dynamic>?> runTest(
      int testID, String testName, String testLimit, int testResult) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('apiToken');

    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Constants.base_url +
        "/FieldScientistAnalysisDPR/add-dpr-test-Testresult-ForEachTest?TestName=$testName&DPRFieldId=$testID&TestLimit=$testLimit&TestResult=$testResult";

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: requestHeaders,
      );
      print(response.body);
      print(url);
      // SHARED
      return jsonDecode(response.body);
    } catch (e) {}
  }
}
