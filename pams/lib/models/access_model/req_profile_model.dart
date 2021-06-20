class ReqProfileModel {
  String fname;
  String lname;
  String email;
  String phone;

  ReqProfileModel({
    this.fname,
    this.lname,
    this.email,
    this.phone,
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
