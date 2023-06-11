import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:act_hub_project/features/forget_password/data/mapper/forget_password_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/constants.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/model/forget_password_model.dart';
import '../../domain/repository/forget_password_repository.dart';
import '../data_source/forget_password_remote_data_source.dart';
import '../request/forget_password_request.dart';

class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  final ForgetPasswordDataSource _forgetPasswordDataSource;
  final NetworkInfo _networkInfo;

  ForgetPasswordRepositoryImpl(
      this._networkInfo, this._forgetPasswordDataSource);

  @override
  Future<Either<Fauiler, ForgetPassword>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _forgetPasswordDataSource
            .forgetPassword(forgetPasswordRequest);
        return Right(response.toDomain());
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
