import 'package:act_hub_project/core/extentions/extentions.dart';

import '../../domain/model/login.dart';
import '../response/login_response.dart';

extension LoginMapper on LoginResponse {
  toDomain() {
    return Login(token: token.onNull());
  }
}
