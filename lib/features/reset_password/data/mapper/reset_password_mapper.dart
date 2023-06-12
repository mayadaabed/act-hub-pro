import '../../domain/model/reset_password_model.dart';
import '../response/reset_password_response.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';

extension ResetPasswordMapper on ResetPasswordResponse {
  ResetPassword toDomain() {
    return ResetPassword(
      status: status.onNull(),
    );
  }
}
