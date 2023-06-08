import 'package:act_hub_project/core/extentions/extentions.dart';
import 'package:act_hub_project/features/home/data/response/attribute_categories_response.dart';
import 'package:act_hub_project/features/home/domain/model/attribute_categories_model.dart';

extension AttributeCategoryMapper on AttributeCategoriesResponse {
  AttributeCategoriesModel toDomain() {
    return AttributeCategoriesModel(
      title: name.onNull(),
      description: description.onNull(),
      image: icon.onNull(),
      type: banner.onNull(),
    );
  }
}
