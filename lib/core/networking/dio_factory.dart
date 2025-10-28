import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {'Accept': 'application/json'};
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        enabled: kDebugMode,
      ),
    );
  }

  static void setAuthorizationHeader(String token) {
    if (dio != null) {
      dio?.options.headers = {'Authorization': 'Bearer $token'};
    }
  }

  static void clearAuthorizationHeader() {
    if (dio != null) {
      dio?.options.headers.remove('Authorization');
    }
  }
}
