import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_btsid/config/pages/app_pages.dart';
import 'package:test_btsid/config/routes/app_routes.dart';
import 'package:test_btsid/config/themes/app_theme.dart';
import 'package:test_btsid/constants/common/app_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      designSize: AppConst.designAppSize(),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BTS.Id App',
          initialRoute: AppRoutes.loginScreen,
          getPages: AppPages.pages(),
          // translations: LazizuLocalization(),
          // locale: LocalizationService.locale,
          // supportedLocales: const [
          //   Locale('id', 'ID'),
          //   Locale('en', 'US'),
          // ],
          // fallbackLocale: LocalizationService.fallbackLocale,
          theme: AppTheme.themeData,
          // localizationsDelegates: const [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          //   DefaultCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: LocalizationService.locales,
        );
      },
    );
  }
}
