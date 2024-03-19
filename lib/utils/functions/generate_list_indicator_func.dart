import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_btsid/config/themes/app_colors.dart';
import 'package:test_btsid/utils/extensions/iteration_ext.dart';

class GenerateListIndicatorFunc {
  Widget customIndicator({
    required int curIndexCardOnCurrentTab,
    required int totalCardEachTab,
    required List<dynamic> cardsOnEachTabs,
    double height = 10,
    double widthInActive = 10,
    double widthNotActive = 10,
    Color colorInActive = AppColors.primary,
    Color colorNotActive = AppColors.greyNeutral40,
  }) {
    return totalCardEachTab <= 1
        ? const SizedBox()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: cardsOnEachTabs
                .extMapIndexed(
                  (e, index) => _customIndicatorWidget(
                    isOnIndicator: curIndexCardOnCurrentTab == index,
                    colorInActive: colorInActive,
                    colorNotActive: colorNotActive,
                    height: height,
                    widthInActive: widthInActive,
                    widthNotActive: widthNotActive,
                  ),
                )
                .toList(),
          );
  }

  Widget _customIndicatorWidget({
    required bool isOnIndicator,
    required double height,
    required double widthInActive,
    required double widthNotActive,
    required Color colorInActive,
    required Color colorNotActive,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Container(
        width: isOnIndicator ? widthInActive.w : widthNotActive.w,
        height: height.h,
        decoration: BoxDecoration(
          color: isOnIndicator ? colorInActive : colorNotActive,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        // padding: EdgeInsets.all(1),
      ),
    );
  }
}
