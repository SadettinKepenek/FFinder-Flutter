import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateListDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentListDto.dart';
import 'package:ffinder/models/Follower_DataTransferObjects/FollowerListDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateListDto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Post_DataTransferObjects/PostListDto.dart';

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
  List<FollowerListDto> followers;
  List<CommentListDto> comments;
  List<PostListDto> posts;
  List<PostRateListDto> postRates;
  List<CommentRateListDto> commentRates;
  UserListDto();
  factory UserListDto.fromJson(Map<String, dynamic> json) => _$UserListDtoFromJson(json);
   Map<String, dynamic> toJson() => _$UserListDtoToJson(this);
}