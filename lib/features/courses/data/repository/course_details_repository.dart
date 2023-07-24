


import 'package:act_hub_project/features/courses/data/mapper/course_details_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/entity/course_details_entity.dart';
import '../data_sourse/course_details_data_source.dart';
import '../request/course_details_request.dart';

abstract class CourseDetailsRepository {
  Future<Either<Fauiler, CourseDetailsEntity>> courseDetails(
      CourseDetailsRequest courseDetailsRequest);
}

class CourseDetailsRepositoryImplementation implements CourseDetailsRepository {
  final NetworkInfo _networkInfo;
  final CourseDetailsDataSource _detailsDataSource;

  CourseDetailsRepositoryImplementation(
    this._networkInfo,
    this._detailsDataSource,
  );

  @override
  Future<Either<Fauiler, CourseDetailsEntity>> courseDetails(
      CourseDetailsRequest courseDetailsRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _detailsDataSource.courseDetails(
          courseDetailsRequest,
        );
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
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }
}