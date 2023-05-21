import 'package:act_hub_project/config/constants.dart';
import 'package:get/get.dart';
import '../../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: Constants.splashDuration), () {
      Get.offAllNamed(Routes.outBoardingView);
    });
  }
}
