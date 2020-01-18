

import 'package:json_annotation/json_annotation.dart';

part 'UserLoginRequestDto.g.dart';

@JsonSerializable()
class UserLoginRequestDto{
  String username;
  String password;
  UserLoginRequestDto();

  factory UserLoginRequestDto.fromJson(Map<String, dynamic> json) => _$UserLoginRequestDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserLoginRequestDtoToJson(this);
}