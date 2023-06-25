import 'package:act_hub_project/config/constants.dart';
import 'package:act_hub_project/core/service/theme_service.dart';
import 'package:act_hub_project/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/dependency_injection.dart';
import 'config/localizations/locale_settings.dart';
import 'core/resources/manager_assets.dart';

void main() async {
  await initModule();
  runApp(
    EasyLocalization(
      supportedLocales: localeSettings.supportedLocales,
      path: translationPath,
      fallbackLocale: localeSettings.defaultLocale,
      startLocale: localeSettings.defaultLocale,
      child: MyApp(),
    ),
  );
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
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
