import 'package:act_hub_project/core/extentions/extentions.dart';
import 'package:act_hub_project/features/home/data/response/attribute_sliders_response.dart';
import 'package:act_hub_project/features/home/domain/model/attribute_slider_model.dart';

extension AttributeSlidersMapper on AttributeSlidersResponse {
  AttributeSliderModel toDomain() {
    return AttributeSliderModel(
      title: title.onNull(),
      description: description.onNull(),
      image: image.onNull(),
      type: type.onNull(),
      id: id.onNull(),
    );
  }
}
