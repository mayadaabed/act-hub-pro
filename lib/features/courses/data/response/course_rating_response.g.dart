// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRatingResponse _$CourseRatingResponseFromJson(
        Map<String, dynamic> json) =>
    CourseRatingResponse()
      ..message = json['message'] as String?
      ..status = json['status'] as bool?;

Map<String, dynamic> _$CourseRatingResponseToJson(
        CourseRatingResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
