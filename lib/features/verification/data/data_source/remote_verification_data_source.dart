import 'package:act_hub_project/features/verification/data/response/verification_response.dart';

import '../../../../core/network/app_api.dart';
import '../request/verification_request.dart';

abstract class RemoteVerificationDataSource {
  Future<VerificationResponse> verification(
      VerificationRequest verificationRequest);
}

class RemoteVerificationDataSourceImpl extends RemoteVerificationDataSource {
  final AppApi _appApi;

  RemoteVerificationDataSourceImpl(this._appApi);

  @override
  Future<VerificationResponse> verification(
      VerificationRequest verificationRequest) async {
    return await _appApi.emailVerification(
      verificationRequest.email,
      verificationRequest.otp,
    );
  }
}
