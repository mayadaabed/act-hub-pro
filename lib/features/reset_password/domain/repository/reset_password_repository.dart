import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../data/request/reset_password_request.dart';
import '../model/reset_password_model.dart';

abstract class ResetPasswordRepository {
  Future<Either<Fauiler, ResetPassword>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}
