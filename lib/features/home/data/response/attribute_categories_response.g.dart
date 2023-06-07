// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeCategoriesResponse _$AttributeCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    AttributeCategoriesResponse()
      ..message = json['message'] as String?
      ..name = json['name'] as String?
      ..description = json['description'] as String?
      ..icon = json['icon'] as String?
      ..banner = json['banner'] as String?;

Map<String, dynamic> _$AttributeCategoriesResponseToJson(
        AttributeCategoriesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'banner': instance.banner,
    };
