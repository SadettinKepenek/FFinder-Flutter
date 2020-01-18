import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateDetailDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentDetailDto.dart';
import 'package:ffinder/models/Follower_DataTransferObjects/FollowerDetailDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateDetailDto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Post_DataTransferObjects/PostDetailDto.dart';

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
  List<FollowerDetailDto> followers;
  List<CommentDetailDto> comments;
  List<PostDetailDto> posts;
  List<PostRateDetailDto> postRates;
  List<CommentRateDetailDto> commentRates;
  UserDetailDto();
  factory UserDetailDto.fromJson(Map<String, dynamic> json) => _$UserDetailDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserDetailDtoToJson(this);
}