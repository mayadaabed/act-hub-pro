import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'edit_password_data_response.dart';

part 'edit_password_response.g.dart';

@JsonSerializable()
class EditPasswordResponse extends BaseResponse {
  @JsonKey(name: ApiConstants.data)
  EditPasswordResponseData? data;

  @JsonKey(name: ApiConstants.status)
  bool? status;

  EditPasswordResponse({ this.data,  this.status});

  factory EditPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$EditPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditPasswordResponseToJson(this);
}
