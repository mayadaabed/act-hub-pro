import '../../domain/model/fcm_token_model.dart';
import '../response/fcm_token_response.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';

extension FcmTokenMapper on FcmTokenResponse {
  FcmTokenModel toDomain() {
    return FcmTokenModel(
      status: status.onNull(),
    );
  }
}
