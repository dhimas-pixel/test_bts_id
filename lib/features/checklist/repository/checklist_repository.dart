import 'package:dio/dio.dart';
import 'package:test_btsid/constants/core/api_const.dart';
import 'package:test_btsid/shared/models/checklist_res.dart';
import 'package:test_btsid/utils/functions/save_local_func.dart';
import 'package:test_btsid/utils/services/api_service.dart';

class ChecklistRepository {
  ChecklistRepository._();

  static Future<CheckListRes> onGetChecklist() async {
    try {
      String? token = await SaveLocalFunc().getToken();
      if (token == null) {
        throw 'Token not available';
      }

      final Dio dio = ApiServices.dioCall(
        authorization: token,
      );

      var response = await dio.get(ApiConst.checklist);

      return CheckListRes.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw e.response?.data is String
            ? (e.response?.data ?? "Error")
            : e.response?.data['message'];
      }

      throw e.message ?? '';
    }
  }
}
