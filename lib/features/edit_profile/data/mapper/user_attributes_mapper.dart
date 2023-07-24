import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/model/user_attribute_model.dart';
import '../response/user_attributes_response.dart';

extension UserAttributesMapper on UserAttributesResponse {
  UserAttributesModel toDomain() {
    return UserAttributesModel(
      name: name.onNull(),
      phone: phone.onNull(),
      email: email.onNull(),
    );
  }
}

extension AttributesUserMapper on AttributesUserResponse {
  AttributesUserModel toDomain() {
    return AttributesUserModel(attributes: attributes?.toDomain());
  }
}