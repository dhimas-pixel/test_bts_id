import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_btsid/constants/common/app_const.dart';

class ApiServices {
  ApiServices._();

  static final ApiServices _apiServices = ApiServices._();

  factory ApiServices() {
    return _apiServices;
  }

  static const int timeoutInMiliSeconds = 15000;

  static Dio dioCall({
    int timeout = timeoutInMiliSeconds,
    String? token,
    String? authorization,
  }) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // headers['is_mobile'] = 'true';

    if (token != null) {
      headers['token'] = token;
    }

    if (authorization != null) {
      headers['Authorization'] = "Bearer $authorization";
    }

    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: AppConst.baseUrl,
        connectTimeout: const Duration(milliseconds: 90000),
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(_authInterceptor());

    return dio;
  }

  static Interceptor _authInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: (reqOptions, handler) {
        log('${reqOptions.uri}', name: 'REQUEST URL');
        log('${reqOptions.headers}', name: 'HEADER');
        log('${reqOptions.data}', name: 'DATA');

        return handler.next(reqOptions);
      },
      onError: (error, handler) async {
        log('${error.requestOptions.uri}', name: 'ERROR FROM');
        log(error.message ?? 'MESSAGE EMPTY', name: 'ERROR MESSAGE');
        log('${error.response}', name: 'RESPONSE');

        return handler.next(error); //return non 401 error
      },
      onResponse: (response, handler) async {
        log('${response.realUri}', name: 'RESPONSE FROM');
        log('${response.data}', name: 'RESPONSE');

        return handler.resolve(response);
      },
    );
  }
}
