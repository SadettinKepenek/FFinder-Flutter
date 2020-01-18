import 'package:json_annotation/json_annotation.dart';

part 'CommentRateListDto.g.dart';

@JsonSerializable()
class CommentRateListDto {
  String commentRateId;
  bool isLike;
  DateTime rateDate;
  String commentId;
  String ownerId;
  bool isActive;
  CommentRateListDto() {}

  factory CommentRateListDto.fromJson(Map<String, dynamic> json) =>
      _$CommentRateListDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentRateListDtoToJson(this);
}
