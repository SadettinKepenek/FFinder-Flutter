import 'package:ffinder/models/ResponseModels/HttpResponseModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'HttpResponseModelBase.dart';

class HttpResponseModelData<T> extends HttpResponseModelBase {
  T data;

  HttpResponseModelData();

  HttpResponseModelData.init({message, statusCode,data}) {
    this.message = message;
    this.statusCode = statusCode;
    this.data=data;
  }
}
