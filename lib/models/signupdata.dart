// To parse this JSON data, do
//
//     final signupdata = signupdataFromJson(jsonString);

import 'dart:convert';

Signupdata signupdataFromJson(String str) => Signupdata.fromJson(json.decode(str));

String signupdataToJson(Signupdata data) => json.encode(data.toJson());

class Signupdata {
  int statusCode;
  String message;
  String data;

  Signupdata({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory Signupdata.fromJson(Map<String, dynamic> json) => Signupdata(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] ??'',
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data??"",
  };
}
