import 'package:ffinder/models/Post_DataTransferObjects/PostListDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserListDto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'PostRateListDto.g.dart';

@JsonSerializable()
class PostRateListDto {
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
  PostRateListDto();

  factory PostRateListDto.fromJson(Map<String, dynamic> json) =>
      _$PostRateListDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PostRateListDtoToJson(this);
}
