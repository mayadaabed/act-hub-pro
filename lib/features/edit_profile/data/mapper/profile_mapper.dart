import 'package:act_hub_project/features/edit_profile/data/mapper/profile_attributes_mapper.dart';
import '../../domain/model/profile_model.dart';
import '../response/profile_response.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';


extension ProfileMapper on ProfileResponse {
  toDomain() => ProfileModel(data: data?.toDomain(), message: message.onNull());
}

extension ProfileDataMapper on ProfileResponseData {
  toDomain() => ProfileModelData(
        id: id.onNull(),
        type: type.onNull(),
        attributes: attributes!.toDomain(),
      );
}