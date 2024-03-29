import 'package:json_annotation/json_annotation.dart';
part 'course_details_data_attributes_response.g.dart';

@JsonSerializable()
class CourseDetailsDataAttributeResponse  {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'active')
  int? active;
  @JsonKey(name: 'resource_id')
  int? resourceId;
  @JsonKey(name: 'hours')
  int? hours;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'avatar')
  String? avatar;

  CourseDetailsDataAttributeResponse({
     this.name,
     this.description,
     this.active,
     this.resourceId,
     this.hours,
     this.price,
     this.rate,
     this.avatar,
  });

  factory CourseDetailsDataAttributeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CourseDetailsDataAttributeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CourseDetailsDataAttributeResponseToJson(this);
}
