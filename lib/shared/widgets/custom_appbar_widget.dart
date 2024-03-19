import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_btsid/config/themes/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double elevation;
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Function()? onBack;
  final Color? backgroundColor;
  final Color? textColor;
  final bool useCenterTitle;
  final TextStyle? titleStyle;
  final Widget? customLeading;
  final bool isLightThemeStatusBar;
  final TextAlign customTextAlign;
  final double? toolbarHeight;

  const CustomAppBarWidget({
    Key? key,
    this.elevation = 2,
    required this.title,
    this.actions,
    this.titleStyle,
    this.bottom,
    this.onBack,
    this.useCenterTitle = true,
    this.backgroundColor,
    this.textColor,
    this.isLightThemeStatusBar = false,
    this.customTextAlign = TextAlign.left,
    this.toolbarHeight = kToolbarHeight,
  })  : customLeading = null,
        super(key: key);

  const CustomAppBarWidget.customLeading({
    Key? key,
    this.elevation = 2,
    required this.title,
    this.customLeading,
    this.actions,
    this.titleStyle,
    this.bottom,
    this.onBack,
    this.useCenterTitle = true,
    this.backgroundColor,
    this.textColor,
    this.isLightThemeStatusBar = false,
    this.customTextAlign = TextAlign.left,
    this.toolbarHeight = kToolbarHeight,
  }) : super(key: key);

  const CustomAppBarWidget.white({
    Key? key,
    required this.title,
    this.actions,
    this.bottom,
    this.onBack,
    this.titleStyle,
    this.useCenterTitle = true,
    this.elevation = 2,
    this.customLeading,
    this.customTextAlign = TextAlign.left,
    this.toolbarHeight = kToolbarHeight,
  })  : backgroundColor = Colors.white,
        textColor = Colors.black,
        isLightThemeStatusBar = false,
        super(key: key);

  const CustomAppBarWidget.black({
    Key? key,
    required this.title,
    this.actions,
    this.bottom,
    this.onBack,
    this.titleStyle,
    this.useCenterTitle = true,
    this.elevation = 2,
    this.customLeading,
    this.customTextAlign = TextAlign.left,
    this.toolbarHeight = kToolbarHeight,
  })  : backgroundColor = Colors.black,
        textColor = Colors.white,
        isLightThemeStatusBar = true,
        super(key: key);

  const CustomAppBarWidget.primary({
    Key? key,
    required this.title,
    this.actions,
    this.bottom,
    this.onBack,
    this.useCenterTitle = true,
    this.titleStyle,
    this.elevation = 2,
    this.customTextAlign = TextAlign.left,
    this.toolbarHeight = kToolbarHeight,
  })  : backgroundColor = AppColors.primary,
        textColor = Colors.white,
        isLightThemeStatusBar = true,
        customLeading = null,
        super(key: key);

  const CustomAppBarWidget.transparent({
    Key? key,
    this.title = '',
    this.actions,
    this.bottom,
    this.onBack,
    this.useCenterTitle = true,
    this.titleStyle,
    this.isLightThemeStatusBar = false,
    this.elevation = 0,
    this.customTextAlign = TextAlign.left,
    this.toolbarHeight = kToolbarHeight,
  })  : backgroundColor = Colors.transparent,
        textColor = Colors.white,
        customLeading = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget leadingWidget() {
      /// * Check Route Sebelumnya
      /// * Untuk mengecheck apakah bisa kembali atau tidak
      /// * Icon default back dari flutter perlu di custom menjadi chevron
      bool canBack = Get.previousRoute.isNotEmpty;

      Widget backWidget = canBack
          ? IconButton(
              onPressed: () {
                if (onBack == null) {
                  Get.back();
                } else {
                  onBack!();
                }
              },
              icon: Icon(
                Icons.chevron_left_rounded,
                color: textColor,
              ),
            )
          : const SizedBox();
      return customLeading ?? backWidget;
    }

    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      centerTitle: useCenterTitle,
      systemOverlayStyle: isLightThemeStatusBar
          ? const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
      title: Text(
        title.tr.toUpperCase(),
        style: titleStyle ??
            TextStyle(
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
        textAlign: customTextAlign,
      ),
      leading: leadingWidget(),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => bottom != null
      ? Size.fromHeight(toolbarHeight! + bottom!.preferredSize.height)
      : Size.fromHeight(toolbarHeight!);
}
