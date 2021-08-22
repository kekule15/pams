// To parse this JSON data, do
//
//     final template = templateFromJson(jsonString);

import 'dart:convert';

Template templateFromJson(String str) => Template.fromJson(json.decode(str));

String templateToJson(Template data) => json.encode(data.toJson());

class Template {
    Template({
        this.status,
        this.message,
        this.returnObject,
    });

    bool? status;
    String? message;
    ReturnObject? returnObject;

    factory Template.fromJson(Map<String, dynamic> json) => Template(
        status: json["status"],
        message: json["message"],
        returnObject: ReturnObject.fromJson(json["returnObject"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "returnObject": returnObject!.toJson(),
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
        value: json["value"],
        sampleTemplateId: json["sampleTemplateID"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "limit": limit,
        "value": value,
        "sampleTemplateID": sampleTemplateId,
        "id": id,
    };
}
