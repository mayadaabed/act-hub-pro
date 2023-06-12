import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../data/request/forget_password_request.dart';
import '../model/forget_password_model.dart';
import '../repository/forget_password_repository.dart';

class ForgetPasswordUseCase
    implements BaseUseCase<ForgetPasswordInput, ForgetPassword> {
  final ForgetPasswordRepository _repository;

  ForgetPasswordUseCase(this._repository);

  @override
  Future<Either<Fauiler, ForgetPassword>> execute(
      ForgetPasswordInput input) async {
    return await _repository.forgetPassword(
      ForgetPasswordRequest(
        email: input.email,
      ),
    );
  }
}

class ForgetPasswordInput {
  String email;

  ForgetPasswordInput({
    required this.email,
  });
}
