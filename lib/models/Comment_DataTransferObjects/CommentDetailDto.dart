import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateDetailDto.dart';
import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateListDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Post_DataTransferObjects/PostDetailDto.dart';

part 'CommentDetailDto.g.dart';

@JsonSerializable()
class CommentDetailDto {
  String commentId;
  String commentBody;
  DateTime commentDate;
  String ownerId;
  String postId;
  bool isActive;
  String ownerUserName;
  String ownerFirstname;
  String ownerLastname;
  String ownerEmail;
    String ownerProfilePhoto;
  PostDetailDto post;
  List<CommentRateListDto> rates;
  CommentDetailDto() {}

  factory CommentDetailDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentDetailDtoToJson(this);
}
