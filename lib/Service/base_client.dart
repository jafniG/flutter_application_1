import 'package:dio/dio.dart';
import 'package:flutter_application_1/constants/api_endpoints.dart';

class BaseClient {
static  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseURL,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  BaseClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.headers['Authorization'] = 'Bearer TOKEN';
          return handler.next(options);
        },
        onError: (e, handler) => handler.next(e),
        onResponse: (r, handler) => handler.next(r),
      ),
    );
  }

 static Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }

 static Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }

 static Future<Response> put(String path, {dynamic data}) {
    return _dio.put(path, data: data);
  }

 static Future<Response> delete(String path) {
    return _dio.delete(path);
  }
}
