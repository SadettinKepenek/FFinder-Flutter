import 'package:ffinder/models/Post_DataTransferObjects/PostListDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Post_DataTransferObjects/PostDetailDto.dart';
part 'PostRateDetailDto.g.dart';

@JsonSerializable()
class PostRateDetailDto {
  String postRateId;
  String postId;
  String ownerId;
  bool isActive;
  bool isLike;
  DateTime rateDate;
  String ownerUserName;
  String ownerFirstname;
  String ownerLastname;
  String ownerEmail;
  String ownerProfilePhoto;
  String postImageUrl;
  String postBody;
  DateTime postPublishDate;
  String postOwnerId;
  String postOwnerProfilePhoto;
  bool postIsActive;
  PostRateDetailDto();

  factory PostRateDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PostRateDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PostRateDetailDtoToJson(this);
}
