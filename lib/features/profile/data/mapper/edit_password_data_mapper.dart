import 'package:act_hub_project/features/profile/data/mapper/edit_password_attributes_mapper.dart';
import '../../domain/model/edit_password_data_model.dart';
import '../response/edit_password_data_response.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';

extension EditPasswordDataMapper on EditPasswordResponseData {
  EditPasswordDataModel toDomain() => EditPasswordDataModel(
      type: type.onNull(), id: id.onNull(), attributes: attributes!.toDomain());
}
