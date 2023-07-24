import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/repository/course_details_repository.dart';
import '../../data/request/course_details_request.dart';
import '../entity/course_details_entity.dart';

class CourseDetailsUseCase
    implements BaseUseCase<CourseDetailsRequest, CourseDetailsEntity> {
  final CourseDetailsRepository _courseDetailsRepository;

  CourseDetailsUseCase(this._courseDetailsRepository);

  @override
  Future<Either<Fauiler, CourseDetailsEntity>> execute(
      CourseDetailsRequest courseDetailsRequest) async {
    return await _courseDetailsRepository.courseDetails(courseDetailsRequest);
  }
}