import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_btsid/features/register/repository/register_repository.dart';
import 'package:test_btsid/utils/services/dialog_service.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  TextEditingController emailC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<void> onRegister() async {
    try {
      DialogService.showLoading();
      var res = await RegisterRepository.register(
        username: usernameC.text,
        password: passwordC.text,
        email: emailC.text,
      );
      DialogService.closeLoading();

      if (res.statusCode == 2000) {
        Get.back();
        DialogService.showDialogGeneral(
          content: const Text('Berhasil Register, Silahkan Login'),
        );
      }
    } catch (e) {
      DialogService.closeLoading();

      DialogService.showDialogGeneral(
        content: const Text('Gagal Register'),
      );
    }
  }
}
