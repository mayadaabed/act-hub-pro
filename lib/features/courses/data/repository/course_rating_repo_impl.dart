
import 'package:act_hub_project/features/courses/data/mapper/course_rating_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/entity/course_rating_entity.dart';
import '../data_sourse/course_rating_data_source.dart';
import '../request/course_rating_request.dart';

abstract class CourseRatingRepository {
  Future<Either<Fauiler, CourseRatingEntity>> courseRating(
    CourseRatingRequest courseRatingRequest,
  );
}

class CourseRatingRepoImplement implements CourseRatingRepository {
  final RemoteCourseRatingDataSource _remoteCourseRatingDataSource;
  final NetworkInfo _networkInfo;

  CourseRatingRepoImplement(
      this._networkInfo, this._remoteCourseRatingDataSource);

  @override
  Future<Either<Fauiler, CourseRatingEntity>> courseRating(
      CourseRatingRequest courseRatingRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteCourseRatingDataSource
            .courseRating(courseRatingRequest);
        return Right(response.toDomain());
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