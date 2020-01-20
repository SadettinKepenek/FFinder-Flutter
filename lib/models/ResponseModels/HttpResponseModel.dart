import 'package:json_annotation/json_annotation.dart';

class HttpResponseModel {
  String message;
  int statusCode;
  HttpResponseModel();
  HttpResponseModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        statusCode = json["statusCode"];
  Map<String, dynamic> toJson() =>
      {'message': message, 'statusCode': statusCode};
}
