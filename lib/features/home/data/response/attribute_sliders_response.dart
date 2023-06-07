import 'package:act_hub_project/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attribute_sliders_response.g.dart';

@JsonSerializable()
class AttributeSlidersResponse extends BaseResponse {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'id')
  String? id;

  AttributeSlidersResponse({
    this.title,
    this.description,
    this.image,
    this.type,
    this.id,
  });

  factory AttributeSlidersResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributeSlidersResponseFromJson(json);

  Map<String, dynamic> toJson(AttributeSlidersResponse instance) =>
      _$AttributeSlidersResponseToJson(this);
}
