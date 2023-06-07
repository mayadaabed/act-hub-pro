import 'package:act_hub_project/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'attribute_categories_response.dart';
part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse extends BaseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'attributes')
  AttributeCategoriesResponse? attributeCategoriesResponse;

  CategoriesResponse({
    this.id,
    this.attributeCategoriesResponse,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
