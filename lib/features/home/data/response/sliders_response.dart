import 'package:act_hub_project/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'attribute_sliders_response.dart';

part 'sliders_response.g.dart';

@JsonSerializable()
class SlidersResponse extends BaseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'attributes')
  AttributeSlidersResponse? attributeSlidersResponse;

  SlidersResponse({
    this.id,
    this.type,
    this.attributeSlidersResponse,
  });

  factory SlidersResponse.fromJson(Map<String, dynamic> json) =>
      _$SlidersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SlidersResponseToJson(this);
}
