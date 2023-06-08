import 'package:act_hub_project/core/error_handler/error_handler.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../data/request/verification_request.dart';
import '../model/verification_model.dart';
import '../repository/verification_repository.dart';

class VerificationUseCase
    extends BaseUseCase<VerificationUseCaseInput, VerificationModel> {
  final VerificationRepository _verificationRepository;

  VerificationUseCase(this._verificationRepository);
  @override
  Future<Either<Fauiler, VerificationModel>> execute(
      VerificationUseCaseInput input) async {
    return await _verificationRepository.verifyEmail(
      VerificationRequest(
        email: input.email,
        otp: input.otp,
      ),
    );
  }
}

class VerificationUseCaseInput {
  String email;
  String otp;

  VerificationUseCaseInput({required this.email, required this.otp});
}
