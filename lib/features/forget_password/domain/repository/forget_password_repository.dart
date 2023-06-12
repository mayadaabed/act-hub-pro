import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import '../../data/request/forget_password_request.dart';
import '../model/forget_password_model.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Fauiler, ForgetPassword>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
}
