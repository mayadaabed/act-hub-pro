// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse()
      ..message = json['message'] as String?
      ..id = json['id'] as int?
      ..attributeCategoriesResponse = json['attributes'] == null
          ? null
          : AttributeCategoriesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>);

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'attributes': instance.attributeCategoriesResponse,
    };
