// To parse this JSON data, do
//
//     final clientSample = clientSampleFromJson(jsonString);

import 'dart:convert';

ClientSampleModel clientSampleFromJson(String str) => ClientSampleModel.fromJson(json.decode(str));

String clientSampleToJson(ClientSampleModel data) => json.encode(data.toJson());

class ClientSampleModel {
    ClientSampleModel({
        this.status,
        this.message,
        this.returnObject,
    });

    bool? status;
    String? message;
    List<ReturnObject>? returnObject;

    factory ClientSampleModel.fromJson(Map<String, dynamic> json) => ClientSampleModel(
        status: json["status"],
        message: json["message"],
        returnObject: List<ReturnObject>.from(json["returnObject"].map((x) => ReturnObject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "returnObject": List<dynamic>.from(returnObject!.map((x) => x.toJson())),
    };
}

class ReturnObject {
    ReturnObject({
        this.name,
        this.sampleType,
        this.testTemplates,
        this.id,
    });

    String? name;
    int? sampleType;
    List<TestTemplate>? testTemplates;
    String? id;

    factory ReturnObject.fromJson(Map<String, dynamic> json) => ReturnObject(
        name: json["name"],
        sampleType: json["sampleType"],
        testTemplates: List<TestTemplate>.from(json["testTemplates"].map((x) => TestTemplate.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "sampleType": sampleType,
        "testTemplates": List<dynamic>.from(testTemplates!.map((x) => x.toJson())),
        "id": id,
    };
}

class TestTemplate {
    TestTemplate({
        this.name,
        this.limit,
        this.value,
        this.sampleTemplateId,
        this.id,
    });

    String? name;
    String? limit;
    String? value;
    String? sampleTemplateId;
    String? id;

    factory TestTemplate.fromJson(Map<String, dynamic> json) => TestTemplate(
        name: json["name"],
        limit: json["limit"],
        value: json["value"] == null ? null : json["value"],
        sampleTemplateId: json["sampleTemplateID"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "limit": limit,
        "value": value == null ? null : value,
        "sampleTemplateID": sampleTemplateId,
        "id": id,
    };
}
