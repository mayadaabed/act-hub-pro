import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base_response/base_response.dart';
import 'course_details_data_response.dart';

 part 'course_details_reponse.g.dart';
 
@JsonSerializable()
class CourseDetailsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  CourseDetailsDataResponse? courseDetailsDataResponse;

  CourseDetailsResponse({ this.courseDetailsDataResponse,});

  factory CourseDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsResponseToJson(this);
}
