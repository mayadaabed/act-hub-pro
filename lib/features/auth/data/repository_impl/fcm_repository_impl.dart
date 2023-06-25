import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:act_hub_project/features/auth/data/mapper/fcm_token_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/constants.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/model/fcm_token_model.dart';
import '../../domain/repository/fcm_token_repository.dart';
import '../data_source/remote_fcm_token_data_source.dart';
import '../request/fcm_request.dart';

class FcmTokenRepositoryImpl implements FcmTokenRepository {
  final RemoteFcmTokenDataSource _dataSource;
  final NetworkInfo networkInfo;

  FcmTokenRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Fauiler, FcmTokenModel>> sendFcmToken(
      FcmTokenRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.login(loginRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).fauiler,
        );
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
