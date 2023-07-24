

import 'package:act_hub_project/features/courses/data/mapper/course_subscription_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/entity/course_subscription_entity.dart';
import '../data_sourse/course_subscription_data_source.dart';
import '../request/course_subscription_request.dart';

abstract class CourseSubscriptionRepository {
  Future<Either<Fauiler, CourseSubscriptionEntity>> courseSubscription(
      CourseSubscriptionRequest courseSubscriptionRequest);
}

class CourseSubscriptionRepoImplement implements CourseSubscriptionRepository {
  final RemoteCourseSubscriptionDataSource _remoteCourseSubscriptionDataSource;
  final NetworkInfo _networkInfo;

  CourseSubscriptionRepoImplement(
    this._networkInfo,
    this._remoteCourseSubscriptionDataSource,
  );

  @override
  Future<Either<Fauiler, CourseSubscriptionEntity>> courseSubscription(
      CourseSubscriptionRequest courseSubscriptionRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteCourseSubscriptionDataSource
            .courseSubscription(courseSubscriptionRequest);
        return Right(
          response.toDomain(),
        );
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).fauiler,
        );
      }
    } else {
      return Left(
        Fauiler(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ManagerStrings.NO_INTERNT_CONNECTION,
        ),
      );
    }
  }
}