

import '../../../../core/network/app_api.dart';
import '../request/edit_password_request.dart';
import '../response/edit_password_response.dart';

abstract class RemoteEditPasswordDataSource {
  Future<EditPasswordResponse> editPassword(EditPasswordRequest request);
}

class RemoteEditPasswordDateSourceImplement
    implements RemoteEditPasswordDataSource {
  AppApi _appApi;

  RemoteEditPasswordDateSourceImplement(this._appApi);

  @override
  Future<EditPasswordResponse> editPassword(EditPasswordRequest request) async {
    return await _appApi.editPassword(request.password, request.confirmPassword);
  }
}