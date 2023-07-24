import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../model/profile_model.dart';
import '../repository/profile_repository.dart';

class ProfileUseCase implements BaseOutUsecase<ProfileModel> {
  final ProfileRepository _repository;

  ProfileUseCase(this._repository);

  @override
  Future<Either<Fauiler, ProfileModel>> execute() async {
    return await _repository.profile();
  }
}