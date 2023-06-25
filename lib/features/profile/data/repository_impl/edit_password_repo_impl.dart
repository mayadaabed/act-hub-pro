import 'package:act_hub_project/features/profile/data/mapper/edit_password_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/model/edit_password_model.dart';
import '../../domain/repository/edit_password_repository.dart';
import '../data_source.dart/edit_password_remote_data_source.dart';
import '../request/edit_password_request.dart';

class EditPasswordRepoImpl implements EditPasswordRepository {
  RemoteEditPasswordDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  EditPasswordRepoImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Fauiler, EditPasswordModel>> editPassword(
      EditPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteDataSource.editPassword(request);
        return Right(response.toDomain());
      } catch (e) {
        try {
          return Left(Fauiler(ResponseCode.INTERNAL_SERVER_ERROR.value,
              ManagerStrings.INTERNAL_SERVER_ERROR));
        } catch (e) {
          return Left(
              Fauiler(ResponseCode.UNKNOWN.value, ManagerStrings.UNKNOWN));
        }
      }
    } else {
      return Left(
        Fauiler(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          'NO_INTERNET_CONNECTION',
        ),
      );
    }
  }
}
