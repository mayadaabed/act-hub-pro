import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:act_hub_project/core/use_case/base_use_case.dart';
import 'package:act_hub_project/features/auth/data/request/login_request.dart';
import 'package:act_hub_project/features/auth/domain/model/login.dart';
import 'package:act_hub_project/features/auth/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginBaseUseCaseInput {
  String? email;
  String? password;

  LoginBaseUseCaseInput({required this.email, required this.password});
}

class LoginUseCase implements BaseUseCase<LoginBaseUseCaseInput, Login> {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<Either<Fauiler, Login>> execute(LoginBaseUseCaseInput input) async {
    return await _loginRepository.login(LoginRequest(
      email: input.email,
      password: input.password,
    ));
  }
}
