import 'package:flutter/material.dart';
import 'package:test_btsid/constants/common/app_logger.dart';

class AppConst {
  AppConst._();

  ///* Informasi aplikasi
  static const String appName = 'BTS.Id App';
  static int? androidVersion;
  static bool isTablet = false;
  // static const Size appDesignSize = Size(428, 926);
  // Size designSize = smartphone;
  // double shortestSide = 0;
  static const smartphone = Size(428, 926);
  static const tablet = Size(428, 1024);

  static const String baseUrl = 'http://94.74.86.174:8080/api';

  static Size designAppSize() {
    final shortestSide = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .size
        .shortestSide;

    if ((shortestSide) < 600) {
      AppLogger.logData(message: 'Smartphone', name: 'Device Size');
      isTablet = false;
      return smartphone;
    } else {
      AppLogger.logData(message: 'Tablet', name: 'Device Size');
      isTablet = true;
      return tablet;
    }
  }
}
