import 'package:act_hub_project/core/network/app_api.dart';
import 'package:act_hub_project/core/network/dio_factory.dart';
import 'package:act_hub_project/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:act_hub_project/features/auth/data/repository_impl/login_repository_impl.dart';
import 'package:act_hub_project/features/auth/domain/repository/login_repository.dart';
import 'package:act_hub_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:act_hub_project/features/auth/domain/use_case/register_use_case.dart';
import 'package:act_hub_project/features/auth/presentation/controller/login_controller.dart';
import 'package:act_hub_project/features/home/presentation/controller/home_controller.dart';
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
import '../features/auth/data/data_source/remote_register_data_source.dart';
import '../features/auth/data/repository_impl/register_repository_impl.dart';
import '../features/auth/domain/repository/register_repository.dart';
import '../features/auth/presentation/controller/register_controller.dart';
import '../features/home/data/data_source/remote_home_data_source.dart';
import '../features/home/data/repository_implementation/home_repository_implementation.dart';
import '../features/home/domain/repository/home_repository.dart';
import '../features/home/domain/use_case/home_use_case.dart';
import '../features/main/presentation/controller/main_controller.dart';
import '../features/verification/data/data_source/remote_verification_data_source.dart';
import '../features/verification/data/repository_implementation/verification_repositroy_impl.dart';
import '../features/verification/domain/repository/verification_repository.dart';
import '../features/verification/domain/use_case/verification_use_case.dart';
import '../features/verification/presentation/controller/verification_controller.dart';

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

  // TODO: ONLY FOR TEST
  // AppSettingsSharedPreferences appSettingsSharedPreferences =
  //     instance<AppSettingsSharedPreferences>();
  // appSettingsSharedPreferences.clear();

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
  disposeSplash();
  disposeOutBoarding();
  disposeRegisterModule();

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
        instance<LoginRepository>(),
      ),
    );
  }

  Get.put<LoginController>(LoginController());
}

disposeLoginModule() {
  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }

  Get.delete<LoginController>();
}

initRegisterModule() {
  disposeLoginModule();

  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
      () => RemoteRegisterDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(
        instance<RemoteRegisterDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
      () => RegisterUseCase(
        instance<RegisterRepository>(),
      ),
    );
  }

  Get.put<RegisterController>(RegisterController());
}

disposeRegisterModule() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }

  Get.delete<RegisterController>();
}

initMainModule() {
  Get.put<MainController>(MainController());
  initHomeModule();
}

initHomeModule() {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImpl(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementation(
        instance<RemoteHomeDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(
        instance<HomeRepository>(),
      ),
    );
  }

  Get.put<HomeController>(HomeController());
}

initVerificationModule() {
  if (!GetIt.I.isRegistered<RemoteVerificationDataSource>()) {
    instance.registerLazySingleton<RemoteVerificationDataSource>(
      () => RemoteVerificationDataSourceImpl(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<VerificationRepository>()) {
    instance.registerLazySingleton<VerificationRepository>(
      () => VerificationRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteVerificationDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<VerificationUseCase>()) {
    instance.registerLazySingleton<VerificationUseCase>(
      () => VerificationUseCase(
        instance<VerificationRepository>(),
      ),
    );
  }

  Get.put<VerificationController>(VerificationController());
}
