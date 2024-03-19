import 'package:dio/dio.dart';
import 'package:test_btsid/constants/core/api_const.dart';
import 'package:test_btsid/shared/models/login_res.dart';
import 'package:test_btsid/utils/services/api_service.dart';

class LoginRepository {
  LoginRepository._();

  static final Dio _dio = ApiServices.dioCall();

  static Future<LoginRes> login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await _dio.post(
        ApiConst.login,
        data: {
          "password": password,
          "username": username,
        },
      );

      return LoginRes.fromJson(response.data);
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
