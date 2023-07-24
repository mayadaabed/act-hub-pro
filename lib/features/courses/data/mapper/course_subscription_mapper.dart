import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/entity/course_subscription_entity.dart';
import '../response/course_subscription_response.dart';

extension CourseSubscriptionMapper on CourseSubscriptionResponse {
  CourseSubscriptionEntity toDomain() => CourseSubscriptionEntity(
        status: status.onNull(),
      );
}
