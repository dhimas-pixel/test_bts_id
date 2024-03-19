import 'package:get/get.dart';
import 'package:test_btsid/config/routes/app_routes.dart';
import 'package:test_btsid/features/checklist/controller/checklist_controller.dart';
import 'package:test_btsid/features/checklist/view/checklist_screen.dart';
import 'package:test_btsid/features/login/controllers/login_controller.dart';
import 'package:test_btsid/features/login/view/login_screen.dart';
import 'package:test_btsid/features/register/controller/register_controller.dart';
import 'package:test_btsid/features/register/view/register_screen.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages() {
    return [
      ..._authFeature,
      ..._checklistFeature,
    ];
  }

  static List<GetPage> get _authFeature => [
        GetPage(
          name: AppRoutes.loginScreen,
          page: () => const LoginScreen(),
          binding: BindingsBuilder(
            () => Get.put<LoginController>(LoginController()),
          ),
        ),
        GetPage(
          name: AppRoutes.registerScreen,
          page: () => const RegisterScreen(),
          binding: BindingsBuilder(
            () => Get.put<RegisterController>(RegisterController()),
          ),
        ),
      ];

  static List<GetPage> get _checklistFeature => [
        GetPage(
          name: AppRoutes.checklistScreen,
          page: () => const CheckListScreen(),
          binding: BindingsBuilder(
            () => Get.put<ChecklistController>(ChecklistController()),
          ),
        ),
      ];
}
