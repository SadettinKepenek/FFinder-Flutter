import 'package:json_annotation/json_annotation.dart';

part 'CommentRateDetailDto.g.dart';

@JsonSerializable()
class CommentRateDetailDto {
  String commentRateId;
  bool isLike;
  DateTime rateDate;
  String commentId;
  String ownerId;
  bool isActive;
  CommentRateDetailDto() {}

  factory CommentRateDetailDto.fromJson(Map<String, dynamic> json) =>
      _$CommentRateDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentRateDetailDtoToJson(this);
}
