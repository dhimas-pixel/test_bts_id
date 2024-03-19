import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_btsid/config/routes/app_routes.dart';
import 'package:test_btsid/features/login/controllers/login_controller.dart';
import 'package:test_btsid/shared/widgets/custom_button_widget.dart';
import 'package:test_btsid/shared/widgets/main_text_form_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextFormFieldWidget.outline(
                controller: controller.usernameC,
                hintText: 'Username',
              ),
              16.h.verticalSpace,
              MainTextFormFieldWidget.outline(
                controller: controller.passwordC,
                hintText: 'Password',
              ),
              16.h.verticalSpace,
              CustomButtonWidget.textOnly(
                text: 'Login',
                onTap: () => controller.onLogin(),
              ),
              16.h.verticalSpace,
              CustomButtonWidget.textOnly(
                text: 'Register',
                onTap: () => Get.toNamed(AppRoutes.registerScreen),
                primaryColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
