import '../../domain/model/edit_password_model.dart';
import '../response/edit_password_response.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';
import 'edit_password_data_mapper.dart';

extension EditPasswordMapper on EditPasswordResponse {
  toDomain() => EditPasswordModel(
      status: status.onNull(),
      data: data?.toDomain(),
      message: message.onNull());
}
