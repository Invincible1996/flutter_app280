import 'package:dio/dio.dart';

///
/// @date: 2021/12/20 10:46
/// @author: kevin
/// @description: dart

class RequestInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('onResponse');
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('onRequest');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('onError');
    super.onError(err, handler);
  }
}
