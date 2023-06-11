import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/request/reset_password_request.dart';
import '../model/reset_password_model.dart';
import '../repository/reset_password_repository.dart';

class ResetPasswordInput {
  String email;
  String password;
  String otp;

  ResetPasswordInput({
    required this.email,
    required this.password,
    required this.otp,
  });
}

class ResetPasswordUseCase
    extends BaseUseCase<ResetPasswordInput, ResetPassword> {
  final ResetPasswordRepository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Fauiler, ResetPassword>> execute(
      ResetPasswordInput input) async {
    return await _repository.resetPassword(
      ResetPasswordRequest(
        email: input.email,
        password: input.password,
        otp: input.otp,
      ),
    );
  }
}
