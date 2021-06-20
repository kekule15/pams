//AUTHOR: Onyekachi Augustus

class ReqLoginModel {
  String email;
  String password;

  ReqLoginModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "password": this.password,
    };
  }
}
