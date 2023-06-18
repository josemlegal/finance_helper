import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl = dotenv.env['NGROK_URL'] ?? "";

  HttpService() {
    _dio.options.baseUrl = baseUrl;

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        return handler.next(response);
      },
      onError: (DioError err, handler) {
        print(
            'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
        return handler.next(err);
      },
    ));
  }
  Dio get dio => _dio;
}
