// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse()
      ..message = json['message'] as String?
      ..id = json['id'] as int?
      ..name = json['name'] as String?;

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'name': instance.name,
    };
