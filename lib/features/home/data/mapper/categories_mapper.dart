import 'package:act_hub_project/features/home/data/response/categories_response.dart';
import 'package:act_hub_project/features/home/domain/model/category_model.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';
import '../mapper/attribute_category_mapper.dart';

extension CategoriesMapper on CategoriesResponse {
  CategoryModel toDomain() {
    return CategoryModel(
      id: id.onNull(),
      attributeCategoryModel: attributeCategoriesResponse?.toDomain(),
    );
  }
}
