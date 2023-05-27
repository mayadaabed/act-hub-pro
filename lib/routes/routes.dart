import 'package:act_hub_project/features/out_boarding/presentation/view/out_boarding_view.dart';
import 'package:flutter/material.dart';

import '../config/dependency_injection.dart';
import '../core/resources/manager_strings.dart';
import '../features/auth/presentation/view/login_view.dart';
import '../features/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String loginView = '/login_view';
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
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(ManagerStrings.noRouteFound),
              ),
              body: Center(
                child: Text(ManagerStrings.noRouteFound),
              ),
            ));
  }
}
