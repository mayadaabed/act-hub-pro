import 'package:act_hub_project/features/edit_profile/domain/model/profile_attributes_model.dart';
import '../../../../core/base_model/base_model.dart';

class ProfileModel extends BaseModel {
  ProfileModelData data;

  ProfileModel({required this.data, required super.message});
}

class ProfileModelData {
  String type;
  int id;
  ProfileAttributesModel attributes;

  ProfileModelData({
    required this.type,
    required this.id,
    required this.attributes,
  });
}
