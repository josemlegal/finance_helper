import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl = dotenv.env['NGROK_URL'] ?? "";

  HttpService() {
    _dio.options.baseUrl = baseUrl;

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError err, handler) {
        return handler.next(err);
      },
    ));
  }
  Dio get dio => _dio;
}
