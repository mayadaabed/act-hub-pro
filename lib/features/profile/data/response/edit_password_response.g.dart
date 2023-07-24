// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPasswordResponse _$EditPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    EditPasswordResponse()
      ..message = json['message'] as String?
      ..data = json['data'] == null
          ? null
          : EditPasswordResponseData.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = json['status'] as bool?;

Map<String, dynamic> _$EditPasswordResponseToJson(
        EditPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };
