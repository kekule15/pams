//AUTHOR: EWANFO LUCKY PETER

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pams/models/access_model/req_login_model.dart';
import 'package:pams/models/access_model/req_profile_model.dart';
import 'package:pams/models/access_model/req_register_model.dart';
import 'package:pams/models/access_model/req_reset_model.dart';
import 'package:pams/models/api_response_model.dart';
import 'package:pams/services/api_services/interface/users_interface.dart';
import 'package:pams/utils/constants.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:pams/utils/strings.dart';

class UsersImplementation implements UsersInterface {
  @override
  Future<APIResponse<dynamic>> loginUser(ReqLoginModel reqLoginModel) async {
    //var formData = FormData.fromMap(reqLoginModel.toJson());
    var body = Map<dynamic, dynamic>.from(reqLoginModel.toJson());

    print("=====INITIATED LOGIN====");
    var options = BaseOptions(
      baseUrl: 'http://chikahenry-001-site1.itempurl.com',
      connectTimeout: 1000,
      receiveTimeout: 1000,
    );
    Dio dio = Dio(options);
    try {
      Response response = await dio.post(
        '/api/v1/Account/SignIn',
        data: body,
        options: Options(method: 'POST'),
      );
      final int statusCode = response.statusCode;

      print(response.toString());
      print("Augustus");
      print(response.statusCode);

      if (statusCode == 200) {
        Map<dynamic, dynamic> jsonData =
            Map<String, dynamic>.from(response.data);

        print(jsonData["returnObject"]['token'].toString());

        if (jsonData["status"]) {
          return APIResponse(data: false, error: true);
        } else {
          print(jsonData["returnObject"]['role'].toString());

          //SAVE DETAIL TO SHARED PREFERENCE

          Prefs.setString(
              Strings.token_pref, jsonData["returnObject"]["token"]);
          Prefs.setString(
              Strings.f_name_pref, jsonData["returnObject"]["fullname"]);
          Prefs.setString(
              Strings.l_name_pref, jsonData["returnObject"]['fullname']);
          Prefs.setString(Strings.role, jsonData["returnObject"]["role"]);
          // Prefs.setString(Strings.phone, jsonData["returnObject"][3]);
          Prefs.setString(Strings.email_pref, reqLoginModel.email);
          Prefs.setBool(Strings.is_logged_in, true);

          return APIResponse(data: jsonData, error: false);
        }
      } else {
        // APIResponse(data: false, error: true);
        print("statusCode is not 200");
      }
    } catch (e) {
      if (e is DioError) {
        print('Error response ${e.message}');
      }
    }

    return APIResponse(data: true, error: false);
  }

  @override
  Future<APIResponse<dynamic>> registerUser(
      ReqRegisterModel reqRegisterModel) async {
    FormData formData = new FormData.fromMap(reqRegisterModel.toJson());

    final response = await Dio()
        .post(
          Constants.api_sub_endpoint["registration"],
          data: formData,
        )
        .timeout(Constants.network_call_duration);

    final int statusCode = response.statusCode;

    if (statusCode == 200 || statusCode == 201) {
      Map<dynamic, dynamic> jsonData = Map<String, dynamic>.from(response.data);

      //SAVE DETAIL TO SHARED PREFERENCE
      Prefs.setString(Strings.token_pref, jsonData["api_key"]);
      Prefs.setString(Strings.f_name_pref, jsonData["fname"]);
      Prefs.setString(Strings.l_name_pref, jsonData["lname"]);
      Prefs.setString(Strings.phone, jsonData["phone"]);

      if (jsonData["error"]) {
        return APIResponse(data: false, error: true);
      } else {
        return APIResponse(data: jsonData, error: false);
      }
    }

    return APIResponse(data: false, error: true);
  }

  @override
  Future<APIResponse<dynamic>> updateProfile(
      ReqProfileModel reqProfileModel, String api_key) async {
    var data = json.encode(reqProfileModel.toJson());

    // var headers = Constants.api_header;

    // headers["authorization"] = api_key;

    var h = {"Authorization": api_key};

    final response = await http.post(
      Uri.parse(Constants.api_sub_endpoint["update_profile"]),
      body: data,
      headers: h,
    );

    final int statusCode = response.statusCode;

    if (statusCode == 200 || statusCode == 201) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      print(jsonData.toString() + "--------");

      if (jsonData["error"]) {
        return APIResponse(data: false, error: true);
      } else {
        return APIResponse(data: jsonData, error: false);
      }
    }

    return APIResponse(data: false, error: true);
  }

  @override
  Future<APIResponse> resetPassword(ReqResetModel reqResetModel) async {
    // TODO: implement resetPassword

    FormData formData = new FormData.fromMap(reqResetModel.toJson());

    final response = await http.post(
      Uri.parse(Constants.api_sub_endpoint["reset_password"]),
      body: formData,
    );

    final int statusCode = response.statusCode;

    print(statusCode.toString());

    if (statusCode == 200 || statusCode == 201) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      print(jsonData.toString() + "--------");

      if (jsonData["error"]) {
        return APIResponse(data: false, error: true);
      } else {
        return APIResponse(data: jsonData, error: false);
      }
    }

    return APIResponse(data: false, error: true);
  }
}
