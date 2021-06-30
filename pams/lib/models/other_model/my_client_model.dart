// import 'dart:convert';
// class MyClient {
//   bool status;
//   String message;
//   List<ReturnObject> returnObject;

//   MyClient({this.status, this.message, this.returnObject});

//   MyClient.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['returnObject'] != null) {
//       returnObject = new List<ReturnObject>();
//       json['returnObject'].forEach((v) {
//         returnObject.add(new ReturnObject.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.returnObject != null) {
//       data['returnObject'] = this.returnObject.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ReturnObject {
//   String name;
//   String email;
//   String address;
//   String registeredDate;
//   List<Null> samplings;
//   List<Null> invoices;
//   String id;

//   ReturnObject(
//       {this.name,
//       this.email,
//       this.address,
//       this.registeredDate,
//       this.samplings,
//       this.invoices,
//       this.id});

//   ReturnObject.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'];
//     address = json['address'];
//     registeredDate = json['registeredDate'];
//     if (json['samplings'] != null) {
//       samplings = new List<Null>();
//       json['samplings'].forEach((v) {
//         samplings.add(new Null.fromJson(v));
//       });
//     }
//     if (json['invoices'] != null) {
//       invoices = new List<Null>();
//       json['invoices'].forEach((v) {
//         invoices.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['address'] = this.address;
//     data['registeredDate'] = this.registeredDate;
//     if (this.samplings != null) {
//       data['samplings'] = this.samplings.map((v) => v.toJson()).toList();
//     }
//     if (this.invoices != null) {
//       data['invoices'] = this.invoices.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     return data;
//   }
// }
