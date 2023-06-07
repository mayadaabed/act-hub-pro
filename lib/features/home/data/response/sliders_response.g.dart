// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidersResponse _$SlidersResponseFromJson(Map<String, dynamic> json) =>
    SlidersResponse()
      ..message = json['message'] as String?
      ..id = json['id'] as int?
      ..type = json['type'] as String?
      ..attributeSlidersResponse = json['attributes'] == null
          ? null
          : AttributeSlidersResponse.fromJson(
              json['attributes'] as Map<String, dynamic>);

Map<String, dynamic> _$SlidersResponseToJson(SlidersResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributeSlidersResponse,
    };
