import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static Future<void> initAuth(UserLoginResponseDto dto) async {
    try {
      FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();

      await flutterSecureStorage.write(key: "authToken", value: dto.token);
      await flutterSecureStorage.write(key: "authId", value: dto.id);
      await flutterSecureStorage.write(
          key: "authExpireDate", value: dto.tokenExpireDate.toIso8601String());
      await flutterSecureStorage.write(
          key: "authUsername", value: dto.username);
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
