import 'package:dio/dio.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl =
      "https://9a46-2803-2a00-9-bfdf-8131-3436-9ca5-ec42.ngrok-free.app/api";

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
