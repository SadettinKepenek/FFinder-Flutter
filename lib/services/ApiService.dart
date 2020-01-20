import 'dart:convert';

import 'package:ffinder/models/ResponseModels/HttpResponseModelData.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginRequestDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:http/http.dart';

class ApiService {
  static loginRequest(UserLoginRequestDto loginRequestDto) async {
    String url = "https://ffindernet.herokuapp.com/api/Users/Login";
    Map<String, String> headers = {"Content-type": "application/json"};
    String data = jsonEncode(loginRequestDto);
    Response response = await post(url, headers: headers, body: data);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      String responseBody = response.body;
      Map<String, dynamic> json=jsonDecode(responseBody);
      UserLoginResponseDto loginResponseDto=UserLoginResponseDto.fromJson(json["data"]);
      return loginResponseDto;
    }
    return null;
  }
}
