import 'dart:convert';

import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginRequestDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:http/http.dart';

import 'StorageService.dart';

class ApiService {
  static Future<UserLoginResponseDto> loginRequest(
      UserLoginRequestDto loginRequestDto) async {
    String url = "https://ffindernet.herokuapp.com/api/Users/Login";
    Map<String, String> headers = {"Content-type": "application/json"};
    String data = jsonEncode(loginRequestDto);
    Response response = await post(url, headers: headers, body: data);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    Map<String, dynamic> json = jsonDecode(responseBody);

    if (statusCode == 200) {
      UserLoginResponseDto loginResponseDto =
          UserLoginResponseDto.fromJson(json["data"]);
      await StorageService.initAuth(loginResponseDto);

      return loginResponseDto;
    }
    return null;
  }

  static Future<UserDetailDto> getMyProfile() async {
    String url = "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization":"Beraer ${(await StorageService.getAuth()).token}"
    };
    Response response = await get(url, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    Map<String, dynamic> json = jsonDecode(responseBody);
    if(statusCode==200){
      UserDetailDto dto=UserDetailDto.fromJson(json["data"]);
      return dto;
    }
    return null;
  }
}
