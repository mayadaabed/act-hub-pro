import 'package:act_hub_project/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'attribute_categories_response.g.dart';

@JsonSerializable()
class AttributeCategoriesResponse extends BaseResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'banner')
  String? banner;

  AttributeCategoriesResponse({
    this.name,
    this.description,
    this.icon,
    this.banner,
  });

  factory AttributeCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributeCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson(AttributeCategoriesResponse instance) =>
      _$AttributeCategoriesResponseToJson(this);
}
