import 'package:act_hub_project/features/home/data/response/sliders_response.dart';
import 'package:act_hub_project/features/home/domain/model/slider_model.dart';
import '../../../../core/extentions/extentions.dart';
import 'attribute_sliders_mapper.dart';

extension SlidersMapper on SlidersResponse {
  SliderModel toDomain() {
    return SliderModel(
      id: id.onNull(),
      type: type.onNull(),
      attributeModel: attributeSlidersResponse?.toDomain(),
    );
  }
}
