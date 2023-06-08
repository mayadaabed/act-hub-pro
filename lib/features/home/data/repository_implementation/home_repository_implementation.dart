import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:act_hub_project/features/home/data/data_source/remote_home_data_source.dart';
import 'package:act_hub_project/features/home/data/mapper/home_mapper.dart';
import 'package:act_hub_project/features/home/domain/model/home_model.dart';
import 'package:act_hub_project/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/constants.dart';
import '../../../../core/internet_checker/internet_checker.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final RemoteHomeDataSource _dataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImplementation(this._dataSource, this.networkInfo);

  @override
  Future<Either<Fauiler, HomeModel>> home() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.homeData();
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
