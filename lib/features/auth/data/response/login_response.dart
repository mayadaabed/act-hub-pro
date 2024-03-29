import 'package:act_hub_project/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base_response/base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: ApiConstants.token)
  String? token;

  LoginResponse({this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson(LoginResponse instance) =>
      _$LoginResponseToJson(this);
}
