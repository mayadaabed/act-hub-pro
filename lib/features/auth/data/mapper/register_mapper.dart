import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/model/register.dart';
import '../response/register_response.dart';

extension RegisterMapper on RegisterResponse {
  toDomain() {
    return Register(status: status.onNull());
  }
}
