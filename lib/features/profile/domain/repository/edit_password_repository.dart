import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import '../../data/request/edit_password_request.dart';
import '../model/edit_password_model.dart';

abstract class EditPasswordRepository {
  Future<Either<Fauiler, EditPasswordModel>> editPassword(
      EditPasswordRequest request);
}
