import '../../domain/model/edit_password_attributes_model.dart';
import '../response/edit_password_attributes_response.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';

extension EditPasswordAttributesMapper on EditPasswordAttributesResponse {
  EditPasswordAttributesModel toDomain() => EditPasswordAttributesModel(
      name: name.onNull(),
      email: email.onNull(),
      phone: phone.onNull(),
      avatar: avatar.onNull());
}
