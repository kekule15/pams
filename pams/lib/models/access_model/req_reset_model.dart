//AUTHOR: EWANFO LUCKY PETER

class ReqResetModel {
  String email;

  ReqResetModel({
  required  this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
    };
  }
}
