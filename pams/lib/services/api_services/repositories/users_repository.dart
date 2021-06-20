//AUTHOR: EWANFO LUCKY PETER


import 'package:pams/models/access_model/req_login_model.dart';
import 'package:pams/models/access_model/req_profile_model.dart';
import 'package:pams/models/access_model/req_register_model.dart';
import 'package:pams/models/access_model/req_reset_model.dart';
import 'package:pams/models/api_response_model.dart';
import 'package:pams/services/api_services/implementations/users_implementation.dart';

class UsersRepository {
  static Future<APIResponse<dynamic>> loginUser(ReqLoginModel reqLoginModel) =>
      UsersImplementation().loginUser(reqLoginModel);

  static Future<APIResponse<dynamic>> registerUser(
          ReqRegisterModel reqRegisterModel) =>
      UsersImplementation().registerUser(reqRegisterModel);

  static Future<APIResponse<dynamic>> updateProfile(
          ReqProfileModel reqProfileModel, String api_key) =>
      UsersImplementation().updateProfile(reqProfileModel, api_key);

  static resetPassword(ReqResetModel reqResetModel) =>
      UsersImplementation().resetPassword(reqResetModel);
}
