import 'package:act_hub_project/core/extentions/extentions.dart';
import 'package:act_hub_project/features/verification/data/response/verification_response.dart';
import 'package:act_hub_project/features/verification/domain/model/verification_model.dart';

extension VerificationMapper on VerificationResponse {
  VerificationModel toDomain() {
    return VerificationModel(
      status: status.onNull(),
    );
  }
}
