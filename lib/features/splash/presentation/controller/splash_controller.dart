import 'package:act_hub_project/config/constants.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/storage/local/app_settings_shared_preferences.dart';
import '../../../../routes/routes.dart';

class SplashController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: Constants.splashDuration), () {
      if (_appSettingsSharedPreferences.getOutBoardingViewed()) {
        Get.offAllNamed(Routes.loginView);
      } else {
        Get.offAllNamed(
          Routes.outBoardingView,
        );
      }
    });
  }
}
