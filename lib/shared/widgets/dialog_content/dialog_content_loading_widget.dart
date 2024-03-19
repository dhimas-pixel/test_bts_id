import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_btsid/config/themes/app_colors.dart';

class DialogContentLoadingWidget extends StatelessWidget {
  final bool barrierDismissible;
  const DialogContentLoadingWidget({
    Key? key,
    required this.barrierDismissible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(barrierDismissible),
      child: Center(
        child: SingleChildScrollView(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(60),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      'Loading ...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
