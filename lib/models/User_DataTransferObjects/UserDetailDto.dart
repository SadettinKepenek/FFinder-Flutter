import 'package:json_annotation/json_annotation.dart';

part 'UserDetailDto.g.dart';

@JsonSerializable()

class UserDetailDto{
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
  UserDetailDto();
  factory UserDetailDto.fromJson(Map<String, dynamic> json) => _$UserDetailDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserDetailDtoToJson(this);
}