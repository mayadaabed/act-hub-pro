// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_sliders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeSlidersResponse _$AttributeSlidersResponseFromJson(
        Map<String, dynamic> json) =>
    AttributeSlidersResponse()
      ..message = json['message'] as String?
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..image = json['image'] as String?
      ..type = json['type'] as String?
      ..id = json['id'] as String?;

Map<String, dynamic> _$AttributeSlidersResponseToJson(
        AttributeSlidersResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'type': instance.type,
      'id': instance.id,
    };
