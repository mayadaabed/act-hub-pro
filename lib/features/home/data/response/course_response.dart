import 'package:json_annotation/json_annotation.dart';

import 'attribute_course_response.dart';
part 'course_response.g.dart';

@JsonSerializable()
class CourseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'isRated')
  bool? isRated;
  @JsonKey(name: 'user_rate')
  double? userRate;
  @JsonKey(name: 'attributes')
  List<AttributeCourseResponse>? attributes;

   CourseResponse({
    this.id,
    this.isRated,
    this.userRate,
    this.attributes,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}
