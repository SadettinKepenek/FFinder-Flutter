import 'package:ffinder/models/ResponseModels/HttpResponseModelBase.dart';
import 'package:json_annotation/json_annotation.dart';

class HttpResponseModel  extends HttpResponseModelBase{

  HttpResponseModel();
  HttpResponseModel.init({String message, int statusCode}) {
    this.message=message;
    this.statusCode=statusCode;
  }


}
