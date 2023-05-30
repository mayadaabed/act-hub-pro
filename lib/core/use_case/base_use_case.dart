import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Fauiler, Out>> execute(In input);
}
