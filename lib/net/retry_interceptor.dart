///
/// @date: 2021/12/20 14:17
/// @author: kevin
/// @description: dart
import 'dart:io';

import 'package:dio/dio.dart';

import 'connectivity_request_retry.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetry requestRetry;

  RetryOnConnectionChangeInterceptor({
    required this.requestRetry,
  });

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      try {
        requestRetry.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        rethrow;
      }
    }
    super.onError(err, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other && err.error != null && err.error is SocketException;
  }
}
