import 'package:act_hub_project/core/extentions/extentions.dart';
import 'package:act_hub_project/features/home/data/response/attribute_course_response.dart';

import '../../domain/model/attribute_course_model.dart';

extension AttributeCourseMapper on AttributeCourseResponse {
  AttributeCourseModel toDomain() {
    return AttributeCourseModel(
      title: title.onNull(),
      description: description.onNull(),
      active: active.onNull(),
      resourceId: resourceId.onNull(),
      hours: hours.onNull(),
      price: price.onNull(),
      rate: rate.onNull(),
      avatar: avatar.onNull(),
      startDate: startDate.onNull(),
      endDate: endDate.onNull(),
    );
  }
}
