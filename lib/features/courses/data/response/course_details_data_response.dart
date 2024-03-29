import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'course_details_data_attributes_response.dart';

part 'course_details_data_response.g.dart';

@JsonSerializable()
class CourseDetailsDataResponse {
  @JsonKey(name: Constants.courseId)
  int? id;
  @JsonKey(name: Constants.courseIsRated)
  bool? isRate;
  @JsonKey(name: Constants.courseUserRate)
  int? userRate;
  @JsonKey(name: Constants.courseAttributes)
  CourseDetailsDataAttributeResponse? courseDetailsDataAttributeResponse;

  CourseDetailsDataResponse({
     this.id,
     this.isRate,
     this.userRate,
     this.courseDetailsDataAttributeResponse,
  });

  factory CourseDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsDataResponseToJson(this);
}
