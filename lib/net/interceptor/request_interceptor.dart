import 'package:dio/dio.dart';
import 'package:flutter_app280/util/log.dart';

///
/// @date: 2021/12/20 10:46
/// @author: kevin
/// @description: dart

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.d(options);
    // super.onRequest(options, handler);
    handler.next(options);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.d(response);
    // super.onResponse(response, handler);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.d(err);
    super.onError(err, handler);
  }
}
