import 'package:act_hub_project/features/home/domain/model/home_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class HomeRepository {
  Future<Either<Fauiler, HomeModel>> home();
}
