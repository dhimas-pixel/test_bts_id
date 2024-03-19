import 'package:get/get.dart';
import 'package:test_btsid/constants/common/app_logger.dart';
import 'package:test_btsid/features/checklist/repository/checklist_repository.dart';
import 'package:test_btsid/shared/models/checklist_res.dart';
import 'package:test_btsid/utils/services/dialog_service.dart';

class ChecklistController extends GetxController {
  static ChecklistController get to => Get.find<ChecklistController>();

  RxList<CheckListDatum> checkListDatum = <CheckListDatum>[].obs;
  Rx<bool> isLoading = false.obs;

  Future<void> onGetChecklist() async {
    try {
      DialogService.showLoading();
      isLoading.value = true;

      var res = await ChecklistRepository.onGetChecklist();
      checkListDatum.value = res.data ?? [];

      isLoading.value = false;
      DialogService.closeLoading();
    } catch (e) {
      DialogService.closeLoading();
      AppLogger.logData(message: e.toString(), name: 'Error onGetChecklist');
    }
  }

  @override
  void onReady() {
    onGetChecklist();
    super.onReady();
  }
}
