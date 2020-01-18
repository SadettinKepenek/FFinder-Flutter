import 'package:json_annotation/json_annotation.dart';

part 'CommentRateAddDto.g.dart';

@JsonSerializable()
class CommentRateAddDto {
  bool isLike;
  DateTime rateDate;
  String commentId;
  String ownerId;
  bool isActive;
  CommentRateAddDto() {}

  factory CommentRateAddDto.fromJson(Map<String, dynamic> json) =>
      _$CommentRateAddDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentRateAddDtoToJson(this);
}
