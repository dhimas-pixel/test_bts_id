import 'package:flutter/material.dart';
import 'package:test_btsid/config/themes/app_colors.dart';
import 'package:test_btsid/config/themes/app_fonts.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.primary),
    iconTheme: const IconThemeData(color: AppColors.primary),
    fontFamily: AppFonts.roboto,
  );
}
