import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = 'https://api.escuelajs.co/api/v1';
    _dio.options.connectTimeout = const Duration(seconds: 10);
  }

  Dio get dio {
    return _dio;
  }
}
