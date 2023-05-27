import 'package:act_hub_project/config/constants.dart';
import 'package:act_hub_project/core/service/theme_service.dart';
import 'package:act_hub_project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/dependency_injection.dart';

void main() async {
  await initModule();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeService _themeService;

  MyApp({super.key}) : _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(Constants.deviceWidth, Constants.deviceHeigth),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashView,
            title: 'Act Hub',
            theme: _themeService.getThemeData(),
            themeMode: _themeService.getThemeMode(),
            home: Container(),
          );
        });
  }
}
