
import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../data/request/register_request.dart';
import '../model/register.dart';

abstract class RegisterRepository {
  Future<Either<Fauiler, Register>> register(RegisterRequest registerRequest);
}