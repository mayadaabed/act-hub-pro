import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Fauiler, ProfileModel>> profile();
}
