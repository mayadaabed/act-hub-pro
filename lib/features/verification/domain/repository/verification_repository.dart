
import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import '../../data/request/verification_request.dart';
import '../model/verification_model.dart';

abstract class VerificationRepository {
  Future<Either<Fauiler, VerificationModel>> verifyEmail(
    VerificationRequest verificationRequest,
  );
}