import 'package:act_hub_project/core/network/app_api.dart';
import 'package:act_hub_project/core/network/dio_factory.dart';
import 'package:act_hub_project/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:act_hub_project/features/auth/data/repository_impl/login_repository_impl.dart';
import 'package:act_hub_project/features/auth/domain/repository/login_repository.dart';
import 'package:act_hub_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:act_hub_project/features/auth/presentation/controller/login_controller.dart';
import 'package:act_hub_project/features/out_boarding/presentation/controller/out_boarding_controller.dart';
import 'package:act_hub_project/features/splash/presentation/controller/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/internet_checker/internet_checker.dart';
import '../core/storage/local/app_settings_shared_preferences.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton(() => AppApi(dio));

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionCheckerPlus(),
    ),
  );
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();

  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() {
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(
        instance(),
      ),
    );
  }

  Get.put<LoginController>(LoginController());
}
