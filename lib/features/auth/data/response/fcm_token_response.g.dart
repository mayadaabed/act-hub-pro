// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenResponse _$FcmTokenResponseFromJson(Map<String, dynamic> json) =>
    FcmTokenResponse()
      ..message = json['message'] as String?
      ..status = json['status'] as bool?;

Map<String, dynamic> _$FcmTokenResponseToJson(FcmTokenResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
