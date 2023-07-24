// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSubscriptionResponse _$CourseSubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    CourseSubscriptionResponse()
      ..message = json['message'] as String?
      ..status = json['status'] as bool?;

Map<String, dynamic> _$CourseSubscriptionResponseToJson(
        CourseSubscriptionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
