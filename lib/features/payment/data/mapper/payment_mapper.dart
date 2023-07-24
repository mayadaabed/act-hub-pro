import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/model/payment_model.dart';
import '../response/payment_response.dart';

extension PaymentMapper on PaymentResponse {
  PaymentModel toDomain() {
    return PaymentModel(
      id: id.onNull(),
      name: name.onNull(),
    );
  }
}