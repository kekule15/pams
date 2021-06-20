//Author: EWANFO LUCKY PETER

class ReqRegisterModel {
  String fname;
  String lname;
  String email;
  String phone;
  String password;

  ReqRegisterModel({
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.password,
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
