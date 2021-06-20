//AUTHOR: EWANFO LUCKY PETER

class ReqResetModel {
  String email;

  ReqResetModel({
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
    };
  }
}
