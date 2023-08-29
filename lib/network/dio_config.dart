import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://flutterwhite.free.beeceptor.com/",
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 5),
        followRedirects: false,
        receiveDataWhenStatusError: true,
        headers: <String, String>{'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll({
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    });

    return dio;
  }
}
