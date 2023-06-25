import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../data/request/edit_password_request.dart';
import '../model/edit_password_model.dart';
import '../repository/edit_password_repository.dart';

class EditPasswordUseCase
    implements BaseUseCase<EditPasswordRequest, EditPasswordModel> {
  final EditPasswordRepository _repository;

  EditPasswordUseCase(this._repository);

  @override
  Future<Either<Fauiler, EditPasswordModel>> execute(
      EditPasswordRequest input) async {
    return await _repository.editPassword(EditPasswordRequest(
        password: input.password, confirmPassword: input.confirmPassword));
  }
}
