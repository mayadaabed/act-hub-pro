import 'package:act_hub_project/config/constants.dart';
import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:act_hub_project/core/internet_checker/internet_checker.dart';
import 'package:act_hub_project/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:act_hub_project/features/auth/data/mapper/login_mapper.dart';
import 'package:act_hub_project/features/auth/data/request/login_request.dart';
import 'package:act_hub_project/features/auth/domain/model/login.dart';
import 'package:act_hub_project/features/auth/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteLoginDataSource _dataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Fauiler, Login>> login(LoginRequest loginRequest) async {
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
      return Left(Fauiler(ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection));
    }
  }
}
