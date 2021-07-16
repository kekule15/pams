//AUTHOR: Onyekachi Augustus

class ReqLoginModel {
  String email;
  String password;

  ReqLoginModel({
   required this.email,
   required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "password": this.password,
    };
  }
}
