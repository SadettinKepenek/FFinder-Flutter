
import 'package:ffinder/models/Comment_DataTransferObjects/CommentDetailDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentListDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PostDetailDto.g.dart';

@JsonSerializable()
class PostDetailDto{
  String postId;
  String postImageUrl;
  String postBody;
  DateTime publishDate;
  bool isActive;
  String ownerId;
  String ownerUserName;
  String ownerFirstname;
  String ownerLastname;
  String ownerEmail;
  String ownerProfilePhoto;
  List<CommentListDto> comments;
  List<PostRateDetailDto> rates;
  PostDetailDto();

  factory PostDetailDto.fromJson(Map<String, dynamic> json) => _$PostDetailDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostDetailDtoToJson(this);

}