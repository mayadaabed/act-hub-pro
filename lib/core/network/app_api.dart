import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../config/constants.dart';
import '../../config/request_constants.dart';
import '../../features/auth/data/response/fcm_token_response.dart';
import '../../features/auth/data/response/login_response.dart';
import '../../features/auth/data/response/register_response.dart';
import '../../features/forget_password/data/response/forget_password_response.dart';
import '../../features/home/data/response/home_response.dart';
import '../../features/reset_password/data/response/reset_password_response.dart';
import '../../features/verification/data/response/send_otp_response.dart';
import '../../features/verification/data/response/verification_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(
    Dio dio, {
    String baseUrl,
  }) = _AppApi;

  @POST(RequestConstants.login)
  Future<LoginResponse> login(
      @Field(ApiConstants.email) email, @Field(ApiConstants.password) password);

  @POST(RequestConstants.register)
  Future<RegisterResponse> register(
    @Field(ApiConstants.name) name,
    @Field(ApiConstants.email) email,
    @Field(ApiConstants.password) password,
    @Field(ApiConstants.passwordConfirmation) passwordConfirmation,
    @Field(ApiConstants.phone) phone,
  );

  @GET(RequestConstants.home)
  Future<HomeResponse> home();

  @POST(RequestConstants.emailVerification)
  Future<VerificationResponse> emailVerification(
    @Field(ApiConstants.verificationEmail) email,
    @Field(ApiConstants.otp) otp,
  );

  @POST(RequestConstants.forgetPasswordRequest)
  Future<ForgetPasswordResponse> forgetPassword(
    @Field(ApiConstants.email) String email,
  );

  @POST(RequestConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Field(ApiConstants.email) email,
    @Field(ApiConstants.password) password,
    @Field(ApiConstants.otp) otp,
  );

  @POST(RequestConstants.sendOtp)
  Future<SendOtpResponse> sendOtp(
    @Field(ApiConstants.email) String email,
  );

  @POST(RequestConstants.fcmTokenUpdate)
  Future<FcmTokenResponse> sendFcmToken(
    @Field(ApiConstants.fcmToken) String? token,
  );
}
