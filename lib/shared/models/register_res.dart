// To parse this JSON data, do
//
//     final registerRes = registerResFromJson(jsonString);

import 'dart:convert';

RegisterRes registerResFromJson(String str) =>
    RegisterRes.fromJson(json.decode(str));

String registerResToJson(RegisterRes data) => json.encode(data.toJson());

class RegisterRes {
  int? statusCode;
  String? message;
  String? errorMessage;
  dynamic data;

  RegisterRes({
    this.statusCode,
    this.message,
    this.errorMessage,
    this.data,
  });

  factory RegisterRes.fromJson(Map<String, dynamic> json) => RegisterRes(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data,
      };
}
