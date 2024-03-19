import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_btsid/shared/widgets/dialog_content/dialog_content_loading_widget.dart';

class DialogService {
  static bool closeLoading() {
    Get.back();

    return false;
  }

  static bool showLoading({
    bool barrierDismissible = false,
  }) {
    Get.dialog(
      DialogContentLoadingWidget(
        barrierDismissible: kDebugMode ? true : barrierDismissible,
      ),
      barrierDismissible: kDebugMode ? true : barrierDismissible,
    );

    return true;
  }

  static Future<T?> showDialogGeneral<T>({
    double margin = 40,
    double radius = 14,
    Color? color,
    Widget? content,
    bool barrierDismissible = true,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool isShowCloseButton = false,
    String? dialogName,
  }) async {
    Get.dialog<T>(
      WillPopScope(
        onWillPop: () => Future.value(barrierDismissible),
        child: Center(
          child: SingleChildScrollView(
            physics: physics,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.all(margin),
                padding: isShowCloseButton
                    ? EdgeInsets.zero
                    : (padding ??= EdgeInsets.all(16.w)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: content ?? const SizedBox(),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      name: dialogName,
    );
    return null;

    // Timer untuk menutup dialog setelah 5 detik
  }
}
