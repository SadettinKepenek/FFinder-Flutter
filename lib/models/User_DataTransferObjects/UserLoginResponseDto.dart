
import 'package:json_annotation/json_annotation.dart';
part 'UserLoginResponseDto.g.dart';
@JsonSerializable()
class UserLoginResponseDto{
  String token;
  DateTime tokenExpireDate;
  String username;
  String id;

  UserLoginResponseDto();

  factory UserLoginResponseDto.fromJson(Map<String, dynamic> json) => _$UserLoginResponseDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserLoginResponseDtoToJson(this);
}