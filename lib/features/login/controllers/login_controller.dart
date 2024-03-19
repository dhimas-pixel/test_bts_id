import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_btsid/config/routes/app_routes.dart';
import 'package:test_btsid/features/login/repository/login_repository.dart';
import 'package:test_btsid/utils/functions/save_local_func.dart';
import 'package:test_btsid/utils/services/dialog_service.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<void> onLogin() async {
    try {
      DialogService.showLoading();
      var res = await LoginRepository.login(
        username: usernameC.text,
        password: passwordC.text,
      );
      DialogService.closeLoading();

      if (res.statusCode == 2110) {
        SaveLocalFunc().saveToken(res.data?.token ?? 'empty');
        DialogService.showDialogGeneral(
          content: const Text('Berhasil Login'),
          barrierDismissible: true,
        );
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAllNamed(AppRoutes.checklistScreen);
        });
      }
    } catch (e) {
      DialogService.closeLoading();

      DialogService.showDialogGeneral(
        content: const Text('Gagal Login'),
      );
    }
  }
}
