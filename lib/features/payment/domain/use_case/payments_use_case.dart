import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../model/payments_model.dart';
import '../repository/payments_repository.dart';

class PaymentsUseCase implements BaseOutUsecase<PaymentsModel> {
  final PaymentsRepository _repository;

  PaymentsUseCase(this._repository);

  @override
  Future<Either<Fauiler, PaymentsModel>> execute() async {
    return await _repository.payments();
  }
}