import 'package:json_annotation/json_annotation.dart';

part 'CommentRateUpdateDto.g.dart';

@JsonSerializable()
class CommentRateUpdateDto {
  String commentRateId;
  bool isLike;
  DateTime rateDate;
  String commentId;
  String ownerId;
  bool isActive;
  CommentRateUpdateDto() {}

  factory CommentRateUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$CommentRateUpdateDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentRateUpdateDtoToJson(this);
}
