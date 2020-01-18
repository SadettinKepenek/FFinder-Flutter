import 'package:json_annotation/json_annotation.dart';

part 'UserUpdateDto.g.dart';

@JsonSerializable()

class UserUpdateDto{
  String id;
  String userName;
  String password;
  String email;
  String phoneNumber;
  String firstname;
  String lastname;
  String profilePhotoUrl;
  String aboutMe;
  String linkedInUrl;
  String facebookUrl;
  String instagramUrl;
  String viberUrl;
  String gender;
  String city;
  String town;
  String country;
  String school;
  bool isActive;
  UserUpdateDto();
  factory UserUpdateDto.fromJson(Map<String, dynamic> json) => _$UserUpdateDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserUpdateDtoToJson(this);
}