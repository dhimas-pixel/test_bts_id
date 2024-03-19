import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_btsid/features/checklist/controller/checklist_controller.dart';

class CheckListScreen extends GetView<ChecklistController> {
  const CheckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(8.h),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text('${controller.checkListDatum[index].name}');
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: controller.checkListDatum.length,
                  ),
                ),
        ),
      ),
    );
  }
}
