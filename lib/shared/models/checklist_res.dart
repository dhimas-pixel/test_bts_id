// To parse this JSON data, do
//
//     final checkListRes = checkListResFromJson(jsonString);

import 'dart:convert';

CheckListRes checkListResFromJson(String str) =>
    CheckListRes.fromJson(json.decode(str));

String checkListResToJson(CheckListRes data) => json.encode(data.toJson());

class CheckListRes {
  int? statusCode;
  String? message;
  dynamic errorMessage;
  List<CheckListDatum>? data;

  CheckListRes({
    this.statusCode,
    this.message,
    this.errorMessage,
    this.data,
  });

  factory CheckListRes.fromJson(Map<String, dynamic> json) => CheckListRes(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null
            ? []
            : List<CheckListDatum>.from(
                json["data"]!.map((x) => CheckListDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CheckListDatum {
  int? id;
  String? name;
  dynamic items;
  bool? checklistCompletionStatus;

  CheckListDatum({
    this.id,
    this.name,
    this.items,
    this.checklistCompletionStatus,
  });

  factory CheckListDatum.fromJson(Map<String, dynamic> json) => CheckListDatum(
        id: json["id"],
        name: json["name"],
        items: json["items"],
        checklistCompletionStatus: json["checklistCompletionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": items,
        "checklistCompletionStatus": checklistCompletionStatus,
      };
}
