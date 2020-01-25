import 'dart:convert';

import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateAddDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostAddDto.dart';

import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostListDto.dart';

import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateAddDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateDetailDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/models/ResponseModels/HttpResponseModel.dart';
import 'package:ffinder/models/ResponseModels/HttpResponseModelBase.dart';
import 'package:ffinder/models/ResponseModels/HttpResponseModelData.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';

import 'package:ffinder/models/User_DataTransferObjects/UserLoginRequestDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'StorageService.dart';
export 'StorageService.dart';

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


  static Future<List<PostDetailDto>> userPostsRequest() async {
    String url = "https://ffindernet.herokuapp.com/api/Posts/";
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (responseJson["data"] as List).map((p) => PostDetailDto.fromJson(p)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
  static Future<HttpResponseModelBase> addRate(PostRateAddDto dto) async {
    String url = "https://ffindernet.herokuapp.com/api/PostRates/Add";
    var authToken = (await StorageService.getAuth()).token;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    String data = jsonEncode(dto.toJson());
    Response response = await post(url, headers: headers, body: data);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    Map<String, dynamic> json = jsonDecode(responseBody);
    HttpResponseModelBase model = new HttpResponseModel();
    model.message = json["message"];
    model.statusCode = json["statusCode"];
    return model;
  }

  static Future<HttpResponseModelBase> addCommentRate(CommentRateAddDto dto) async {
    String url = "https://ffindernet.herokuapp.com/api/CommentRates/Add";
    var authToken = (await StorageService.getAuth()).token;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    String data = jsonEncode(dto.toJson());
    Response response = await post(url, headers: headers, body: data);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    Map<String, dynamic> json = jsonDecode(responseBody);
    HttpResponseModelBase model = new HttpResponseModel();
    model.message = json["message"];
    model.statusCode = json["statusCode"];
    return model;
  }

  static Future<HttpResponseModelBase> deleteRate(
      String postId, String ownerId) async {
    String url =
        "https://ffindernet.herokuapp.com/api/PostRates/Delete/$postId/$ownerId";
    var authToken = (await StorageService.getAuth()).token;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    Response response = await delete(url, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    Map<String, dynamic> json = jsonDecode(responseBody);
    HttpResponseModelBase model = new HttpResponseModel();
    model.message = json["message"];
    model.statusCode = json["statusCode"];
    return model;
  }

  static Future<HttpResponseModelBase> deleteCommentRate(
      String commentId, String ownerId) async {
    String url =
        "https://ffindernet.herokuapp.com/api/CommentRates/Delete/$commentId/$ownerId";
    var authToken = (await StorageService.getAuth()).token;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    Response response = await delete(url, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    Map<String, dynamic> json = jsonDecode(responseBody);
    HttpResponseModelBase model = new HttpResponseModel();
    model.message = json["message"];
    model.statusCode = json["statusCode"];
    return model;
  }

  static Future<HttpResponseModelBase> getPost(
      {@required String postId}) async {
    String url = "https://ffindernet.herokuapp.com/api/Posts/GetById?id=$postId";
    var authToken = (await StorageService.getAuth()).token;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    Response response = await get(url, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    if (responseBody != "") {
      Map<String, dynamic> json = jsonDecode(responseBody);
      if (statusCode == 200) {
        PostDetailDto dto = PostDetailDto.fromJson(json["data"]);
        HttpResponseModelData<PostDetailDto> model=new HttpResponseModelData<PostDetailDto>();
        model.data=dto;
        model.message="Başarılı";
        model.statusCode=200;
        return model;
      }
      return HttpResponseModel.init(message: "Hata Oluştu", statusCode: 400);
    }
    return HttpResponseModel.init(message: "Hata Oluştu", statusCode: 400);
  }

  static Future<UserDetailDto> getMyProfile() async {
    String url = "https://ffindernet.herokuapp.com/api/Users/";
    var authToken = (await StorageService.getAuth()).token;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    Response response = await get(url, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    if (responseBody != "") {
      Map<String, dynamic> json = jsonDecode(responseBody);
      if (statusCode == 200) {
        UserDetailDto dto = UserDetailDto.fromJson(json["data"]);
        return dto;
      }
    }

    return null;

  }
  static Future<HttpResponseModel> addUsersPost(
      PostAddDto postAddDto) async {
    String url = "https://ffindernet.herokuapp.com/api/Posts/Add";
    var authToken = (await StorageService.getAuth()).token;

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $authToken"
    };
    String data = jsonEncode(postAddDto);
    Response response = await post(url, headers: headers, body: data);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      return HttpResponseModel.init(message: "Post Başarıyla Eklendi",statusCode: statusCode);
    }
          return HttpResponseModel.init(message: "Post Eklenirken Bir Hata Oluştu",statusCode: statusCode);
  }
}
