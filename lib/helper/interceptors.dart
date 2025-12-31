import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../core/app_constants.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    DateTime _now = DateTime.now().toUtc();
    options.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(options.headers.toString());
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      log(jsonEncode(response.data).toString());
      return response.data['status']['success'] as bool
          ? super.onResponse(response, handler)
          : handler.reject(DioException(
              requestOptions: response.requestOptions,
              error: response.data,
              response: response,
              type: DioExceptionType.badResponse));
    } catch (e) {
      handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: "Something went wrong",
        response: response,
        type: DioExceptionType.unknown,
      ));
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("eroor===>${err.requestOptions.baseUrl}, ${err.requestOptions.path} ,${err.requestOptions.uri}");
    log(jsonEncode(err.requestOptions.baseUrl));
    log(jsonEncode(err.requestOptions.path));
    log(jsonEncode(err.requestOptions.uri));
    super.onError(err, handler);
  }
}
