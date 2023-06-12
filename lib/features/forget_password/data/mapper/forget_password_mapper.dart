import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/model/forget_password_model.dart';
import '../response/forget_password_response.dart';

extension ForgetPasswordMapper on ForgetPasswordResponse {
  toDomain() => ForgetPassword(
        status: status!.onNull(),
      );
}
