import 'package:act_hub_project/features/out_boarding/presentation/controller/out_boarding_controller.dart';
import 'package:act_hub_project/features/splash/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

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
