// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListDto _$UserListDtoFromJson(Map<String, dynamic> json) {
  return UserListDto()
    ..id = json['id'] as String
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..firstname = json['firstname'] as String
    ..lastname = json['lastname'] as String
    ..profilePhotoUrl = json['profilePhotoUrl'] as String
    ..aboutMe = json['aboutMe'] as String
    ..linkedInUrl = json['linkedInUrl'] as String
    ..facebookUrl = json['facebookUrl'] as String
    ..instagramUrl = json['instagramUrl'] as String
    ..viberUrl = json['viberUrl'] as String
    ..gender = json['gender'] as String
    ..city = json['city'] as String
    ..town = json['town'] as String
    ..country = json['country'] as String
    ..school = json['school'] as String
    ..isActive = json['isActive'] as bool
    ..followers = (json['followers'] as List)
        ?.map((e) => e == null
            ? null
            : FollowerListDto.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..comments = (json['comments'] as List)
        ?.map((e) => e == null
            ? null
            : CommentListDto.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..posts = (json['posts'] as List)
        ?.map((e) =>
            e == null ? null : PostListDto.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..postRates = (json['postRates'] as List)
        ?.map((e) => e == null
            ? null
            : PostRateListDto.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..commentRates = (json['commentRates'] as List)
        ?.map((e) => e == null
            ? null
            : CommentRateListDto.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserListDtoToJson(UserListDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'aboutMe': instance.aboutMe,
      'linkedInUrl': instance.linkedInUrl,
      'facebookUrl': instance.facebookUrl,
      'instagramUrl': instance.instagramUrl,
      'viberUrl': instance.viberUrl,
      'gender': instance.gender,
      'city': instance.city,
      'town': instance.town,
      'country': instance.country,
      'school': instance.school,
      'isActive': instance.isActive,
      'followers': instance.followers,
      'comments': instance.comments,
      'posts': instance.posts,
      'postRates': instance.postRates,
      'commentRates': instance.commentRates,
    };
