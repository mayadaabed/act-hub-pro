import 'package:act_hub_project/core/base_response/base_response.dart';
import 'package:act_hub_project/features/home/data/response/categories_response.dart';
import 'package:act_hub_project/features/home/data/response/sliders_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_response.dart';
part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'sliders')
  List<SlidersResponse>? sliders;
  @JsonKey(name: 'categories')
  List<CategoriesResponse>? categories;
  @JsonKey(name: 'courses')
  List<CourseResponse>? courses;

  HomeResponse({
    this.sliders,
    this.categories,
    this.courses,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
