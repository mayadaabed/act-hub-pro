import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:act_hub_project/features/verification/data/mapper/verification_mapper.dart';
import 'package:act_hub_project/features/verification/data/request/verification_request.dart';
import 'package:act_hub_project/features/verification/domain/model/verification_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../config/constants.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/verification_repository.dart';
import '../data_source/remote_verification_data_source.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  final RemoteVerificationDataSource _remoteVerificationDataSource;
  final NetworkInfo _networkInfo;

  VerificationRepositoryImpl(
      this._networkInfo, this._remoteVerificationDataSource);
  @override
  Future<Either<Fauiler, VerificationModel>> verifyEmail(VerificationRequest verificationRequest) async {
     if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteVerificationDataSource
            .verification(verificationRequest);
        if (response.status != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Fauiler(
              ResponseCode.BAD_REQUEST.value,
              ManagerStrings.badRequest,
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).fauiler);
      }
    } else {
      return Left(
        Fauiler(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }
}
