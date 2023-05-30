import 'package:act_hub_project/features/auth/data/request/login_request.dart';
import 'package:act_hub_project/features/auth/domain/model/login.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';

abstract class LoginRepository {
  Future<Either<Fauiler, Login>> login(LoginRequest loginRequest);
}
