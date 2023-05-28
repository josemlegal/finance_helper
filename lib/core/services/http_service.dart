import 'package:dio/dio.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl =
      "https://57c5-2803-2a00-9-bfdf-d9e1-f9cf-1b28-1f6f.ngrok-free.app/api";

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
