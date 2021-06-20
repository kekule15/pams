//AUTHOR: EWANFO LUCKY PETER



import 'package:pams/models/access_model/req_login_model.dart';
import 'package:pams/models/access_model/req_profile_model.dart';
import 'package:pams/models/access_model/req_register_model.dart';
import 'package:pams/models/access_model/req_reset_model.dart';
import 'package:pams/models/api_response_model.dart';

abstract class UsersInterface {
  //User login
  Future<APIResponse<dynamic>> loginUser(ReqLoginModel reqLoginModel);

  //User registration
  Future<APIResponse<dynamic>> registerUser(ReqRegisterModel reqRegisterModel);

  //Update Profile
  Future<APIResponse<dynamic>> updateProfile(
      ReqProfileModel reqProfileModel, String api_key);

  Future<APIResponse<dynamic>> resetPassword(ReqResetModel reqResetModel);
}
