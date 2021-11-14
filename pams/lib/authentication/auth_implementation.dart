import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthImplementation {
  //sign in user
  Future userLogin(
      {String? email, String? password}) async {
    var url = 'http://sethlab-001-site1.itempurl.com/api/v1/Account/SignIn';
    var body = {
      'email': email,
      'password': password,
    };

    final response = await Dio().post(url,
        data: body,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    print(response.data);

    return response.data;
  }
}
