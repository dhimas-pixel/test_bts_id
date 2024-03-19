import 'package:dio/dio.dart';
import 'package:test_btsid/constants/core/api_const.dart';
import 'package:test_btsid/shared/models/register_res.dart';
import 'package:test_btsid/utils/services/api_service.dart';

class RegisterRepository {
  RegisterRepository._();

  static final Dio _dio = ApiServices.dioCall();

  static Future<RegisterRes> register({
    required String username,
    required String password,
    required String email,
  }) async {
    try {
      var response = await _dio.post(
        ApiConst.register,
        data: {
          "email": email,
          "password": password,
          "username": username,
        },
      );

      return RegisterRes.fromJson(response.data);
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
