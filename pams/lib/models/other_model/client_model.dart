// To parse this JSON data, do
//
//     final clientModel = clientModelFromJson(jsonString);

import 'dart:convert';

 ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

// String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    ClientModel({
      required  this.status,
      required  this.message,
      required  this.returnObject,
    });

    bool status;
    String message;
    List<ReturnObject> returnObject;

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        status: json["status"],
        message: json["message"],
        returnObject: List<ReturnObject>.from(json["returnObject"].map((x) => ReturnObject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "returnObject": List<dynamic>.from(returnObject.map((x) => x.toJson())),
    };
}

class ReturnObject {
    ReturnObject( {
      required  this.name,
      required  this.email,
      required  this.address,
      required  this.registeredDate,
      required  this.samplings,
      required  this.invoices,
      required  this.id,
    });

    String name;
    String email;
    String address;
    DateTime registeredDate;
    List<Sampling> samplings;
    List<Invoice> invoices;
    String id;

    factory ReturnObject.fromJson(Map<String, dynamic> json) => ReturnObject(
        name: json["name"],
        email: json["email"],
        address: json["address"],
        registeredDate: DateTime.parse(json["registeredDate"]),
        samplings: List<Sampling>.from(json["samplings"].map((x) => Sampling.fromJson(x))),
        invoices: List<Invoice>.from(json["invoices"].map((x) => Invoice.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "address": address,
        "registeredDate": registeredDate.toIso8601String(),
        "samplings": List<dynamic>.from(samplings.map((x) => x.toJson())),
        "invoices": List<dynamic>.from(invoices.map((x) => x.toJson())),
        "id": id,
    };
}

class Invoice {
    Invoice({
      required  this.items,
      required  this.paid,
      required  this.inoviceNumber,
      required  this.dueDate,
      required  this.dateGenerated,
      required  this.clientId,
      required  this.samplingId,
      required  this.id,
    });

    String items;
    bool paid;
    String inoviceNumber;
    DateTime dueDate;
    DateTime dateGenerated;
    String clientId;
    String samplingId;
    String id;

    factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        items: json["items"],
        paid: json["paid"],
        inoviceNumber: json["inoviceNumber"],
        dueDate: DateTime.parse(json["dueDate"]),
        dateGenerated: DateTime.parse(json["dateGenerated"]),
        clientId: json["clientID"],
        samplingId: json["samplingID"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "items": items,
        "paid": paid,
        "inoviceNumber": inoviceNumber,
        "dueDate": dueDate.toIso8601String(),
        "dateGenerated": dateGenerated.toIso8601String(),
        "clientID": clientId,
        "samplingID": samplingId,
        "id": id,
    };
}

class Sampling {
    Sampling({
      required  this.clientId,
      required  this.staffId,
      required  this.staffName,
      required  this.samplingTime,
      required  this.samplingDate,
      required  this.sampleType,
      required  this.status,
      required  this.samples,
      required  this.id,
    });

    String clientId;
    String staffId;
    String staffName;
    DateTime samplingTime;
    DateTime samplingDate;
    int sampleType;
    int status;
    List<Sample> samples;
    String id;

    factory Sampling.fromJson(Map<String, dynamic> json) => Sampling(
        clientId: json["clientID"],
        staffId: json["staffId"],
        staffName: json["staffName"],
        samplingTime: DateTime.parse(json["samplingTime"]),
        samplingDate: DateTime.parse(json["samplingDate"]),
        sampleType: json["sampleType"],
        status: json["status"],
        samples: List<Sample>.from(json["samples"].map((x) => Sample.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "clientID": clientId,
        "staffId": staffId,
        "staffName": staffName,
        "samplingTime": samplingTime.toIso8601String(),
        "samplingDate": samplingDate.toIso8601String(),
        "sampleType": sampleType,
        "status": status,
        "samples": List<dynamic>.from(samples.map((x) => x.toJson())),
        "id": id,
    };
}

class Sample {
    Sample({
     required   this.samplingId,
     required   this.name,
      required  this.sampleType,
      required  this.tests,
      required  this.id,
    });

    String samplingId;
    String name;
    int sampleType;
    List<Test> tests;
    String id;

    factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        samplingId: json["samplingID"],
        name: json["name"],
        sampleType: json["sampleType"],
        tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "samplingID": samplingId,
        "name": name,
        "sampleType": sampleType,
        "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
        "id": id,
    };
}

class Test {
    Test({
      required  this.name,
      required  this.limit,
      required  this.value,
      required  this.sampleId,
      required  this.id,
    });

    String name;
    String limit;
    String value;
    String sampleId;
    String id;

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        name: json["name"],
        limit: json["limit"],
        value: json["value"],
        sampleId: json["sampleID"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "limit": limit,
        "value": value,
        "sampleID": sampleId,
        "id": id,
    };
}
