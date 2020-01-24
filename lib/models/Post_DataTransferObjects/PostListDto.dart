
import 'package:ffinder/models/Comment_DataTransferObjects/CommentListDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateListDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserListDto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PostListDto.g.dart';

@JsonSerializable()
class PostListDto{
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
  List<PostRateListDto> rates;
  PostListDto();

  factory PostListDto.fromJson(Map<String, dynamic> json) => _$PostListDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostListDtoToJson(this);

}