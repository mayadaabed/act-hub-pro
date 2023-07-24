// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_details_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailsResponse _$CourseDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    CourseDetailsResponse()
      ..message = json['message'] as String?
      ..courseDetailsDataResponse = json['data'] == null
          ? null
          : CourseDetailsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$CourseDetailsResponseToJson(
        CourseDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.courseDetailsDataResponse,
    };
