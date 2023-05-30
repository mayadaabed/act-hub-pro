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
  final RemoteLoginDataSourceImplement _dataSourceImplement;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(this._dataSourceImplement, this.networkInfo);

  @override
  Future<Either<Fauiler, Login>> login(LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      final response = await _dataSourceImplement.login(loginRequest);
      return Right(response.toDomain());
    } else {
      return Left(Fauiler(ResponseCode.NO_INTERNET_CONNECTION.value, ApiConstants.noInternetConnection));
    }
  }
}
