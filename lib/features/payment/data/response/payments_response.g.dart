// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsResponse _$PaymentsResponseFromJson(Map<String, dynamic> json) =>
    PaymentsResponse()
      ..message = json['message'] as String?
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PaymentsResponseToJson(PaymentsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
