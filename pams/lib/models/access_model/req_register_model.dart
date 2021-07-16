//Author: EWANFO LUCKY PETER

class ReqRegisterModel {
  String fname;
  String lname;
  String email;
  String phone;
  String password;

  ReqRegisterModel({
   required this.fname,
  required  this.lname,
  required  this.email,
  required  this.phone,
  required  this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "fname": fname,
      "lname": lname,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
