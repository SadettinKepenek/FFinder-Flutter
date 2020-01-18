import 'package:json_annotation/json_annotation.dart';

part 'UserAddDto.g.dart';

@JsonSerializable()

class UserAddDto{
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
  UserAddDto();
  factory UserAddDto.fromJson(Map<String, dynamic> json) => _$UserAddDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserAddDtoToJson(this);
}