import 'dart:convert';

import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static Future<void> clearAuth() async {
    FlutterSecureStorage storage = new FlutterSecureStorage();

    await storage.delete(key: "authToken");
    await storage.delete(key: "authId");
    await storage.delete(key: "authExpireDate");
    await storage.delete(key: "authUsername");
  }

  static Future<void> initMyProfile(UserDetailDto profile) async {
    FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
    String profileString = jsonEncode(profile.toJson());
    await flutterSecureStorage.write(key: "myProfile", value: profileString);
  }

  static Future<UserDetailDto> getMyProfile() async {
    FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();

    UserDetailDto dto = UserDetailDto.fromJson(
        jsonDecode(await flutterSecureStorage.read(key: "myProfile")));
    return dto;
  }

  static Future<void> initAuth(UserLoginResponseDto dto) async {
    try {
      FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
      await clearAuth().then((callHandler) async {
        await flutterSecureStorage.write(key: "authToken", value: dto.token);
        await flutterSecureStorage.write(key: "authId", value: dto.id);
        await flutterSecureStorage.write(
            key: "authExpireDate",
            value: dto.tokenExpireDate.toIso8601String());
        await flutterSecureStorage.write(
            key: "authUsername", value: dto.username);
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<UserLoginResponseDto> getAuth() async {
    FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
    UserLoginResponseDto dto = new UserLoginResponseDto();
    dto.token = await flutterSecureStorage.read(key: "authToken");
    dto.id = await flutterSecureStorage.read(key: "authId");
    dto.tokenExpireDate =
        DateTime.parse(await flutterSecureStorage.read(key: "authExpireDate"));
    dto.username = await flutterSecureStorage.read(key: "authUsername");
    return dto;
  }
}
