import 'package:act_hub_project/core/error_handler/error_handler.dart';
import 'package:act_hub_project/core/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';
import '../repository/home_repository.dart';

class HomeUseCase implements BaseOutUsecase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<Either<Fauiler, dynamic>> execute() async {
    return await _homeRepository.home();
  }
}
