class ReqProfileModel {
  String fname;
  String lname;
  String email;
  String phone;

  ReqProfileModel({
  required  this.fname,
  required  this.lname,
  required  this.email,
  required  this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "fname": this.fname,
      "lname": this.lname,
      "email": this.email,
      "phone": this.phone,
    };
  }
}
