import 'package:dio/dio.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl = '';

  HttpService() {
    _dio.options.baseUrl = baseUrl;
  }
  Dio get dio => _dio;
}
