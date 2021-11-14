import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthImplementation {
  //sign in user
  Future<Map<String, dynamic>?> userLogin(
      {String? email, String? password}) async {
    var url = '';
    var body = {
      'email': email,
      'password': password,
    };

    final response = await http
        .post(Uri.parse(url), body: body);

    final int statusCode = response.statusCode;
    print(statusCode);
    if (response.statusCode == 200) {
      return Map.from(jsonDecode(response.body));
    }
  }
}
