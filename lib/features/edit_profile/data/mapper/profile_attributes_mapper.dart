import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/model/profile_attributes_model.dart';
import '../response/profile_attributes_response.dart';

extension ProfileAttributesMapper on ProfileAttributesResponse {
  ProfileAttributesModel toDomain() => ProfileAttributesModel(
        name: name.onNull(),
        email: email.onNull(),
        phone: phone.onNull(),
        avatar: avatar.onNull(),
      );
}