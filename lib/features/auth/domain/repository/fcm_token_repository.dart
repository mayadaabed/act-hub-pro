import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import '../../data/request/fcm_request.dart';
import '../model/fcm_token_model.dart';

abstract class FcmTokenRepository {
  Future<Either<Fauiler, FcmTokenModel>> sendFcmToken(FcmTokenRequest loginRequest);
}