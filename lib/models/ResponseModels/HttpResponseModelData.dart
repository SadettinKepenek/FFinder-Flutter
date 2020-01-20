import 'package:ffinder/models/ResponseModels/HttpResponseModel.dart';
import 'package:json_annotation/json_annotation.dart';

class HttpResponseModelData<T> {
  T data;
  String message;
  int statusCode;
  HttpResponseModelData();
  HttpResponseModelData.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        message = json['message'],
        statusCode = json["statusCode"];
  Map<String, dynamic> toJson() =>
      {'data': data, 'message': message, 'statusCode': statusCode};

  HttpResponseModelData.init({message, statusCode}) {
    this.message = message;
    this.statusCode = statusCode;
  }
}
