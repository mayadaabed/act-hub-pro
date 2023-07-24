import 'package:act_hub_project/features/payment/data/response/payment_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'payments_response.g.dart';

@JsonSerializable()
class PaymentsResponse extends BaseResponse {
  @JsonKey(name: ApiConstants.data)
  List<PaymentResponse>? data;

  PaymentsResponse({
     this.data,
  });

  factory PaymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsResponseToJson(this);
}