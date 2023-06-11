import 'package:act_hub_project/features/forget_password/presentation/view/forget_password_view.dart';
import 'package:act_hub_project/features/out_boarding/presentation/view/out_boarding_view.dart';
import 'package:flutter/material.dart';

import '../config/dependency_injection.dart';
import '../core/resources/manager_strings.dart';
import '../features/auth/presentation/view/login_view.dart';
import '../features/auth/presentation/view/register_view.dart';
import '../features/home/presentation/view/home_view.dart';
import '../features/main/presentation/view/main_view.dart';
import '../features/reset_password/presentation/view/reset_password_controller.dart';
import '../features/splash/presentation/view/splash_view.dart';
import '../features/verification/presentation/view/verification_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String loginView = '/login_view';
  static const String homeView = '/home_view';
  static const String registerView = '/register_view';
  static const String mainView = '/main_view';
  static const String verificationView = '/verification_view';
  static const String forgetPassword = '/forget_password_view';
  static const String resetPassword = '/reset_password';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoardingView:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      case Routes.loginView:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerView:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.mainView:
        initMainModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.homeView:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.verificationView:
        initVerificationModule();
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case Routes.forgetPassword:
        initForgetPassword();
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case Routes.resetPassword:
        initResetPasswordModule();
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(ManagerStrings.noRoutFound),
              ),
              body: const Center(
                child: Text(ManagerStrings.noRoutFound),
              ),
            ));
  }
}
