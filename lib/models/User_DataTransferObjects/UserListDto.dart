import 'package:json_annotation/json_annotation.dart';

part 'UserListDto.g.dart';

@JsonSerializable()

class UserListDto{
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
  UserListDto();
  factory UserListDto.fromJson(Map<String, dynamic> json) => _$UserListDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserListDtoToJson(this);
}