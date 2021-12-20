import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app280/net/connectivity_request_retry.dart';
import 'package:flutter_app280/net/interceptor/request_interceptor.dart';
import 'package:flutter_app280/net/proxy.dart';
import 'package:flutter_app280/net/retry_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'cache.dart';
import 'error_interceptor.dart';
import 'global.dart';

///
/// @date: 2021/12/20 13:21
/// @author: kevin
/// @description: dart
class Http {
  ///超时时间
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  static final Http _instance = Http._internal();

  factory Http() => _instance;

  late Dio dio;

  final CancelToken _cancelToken = CancelToken();

  Http._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      connectTimeout: connectTimeout,

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: receiveTimeout,

      // Http请求头.
      headers: {},
    );

    dio = Dio(options);

    // 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(RequestInterceptor());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    if (Global.retryEnable) {
      dio.interceptors.add(
        RetryOnConnectionChangeInterceptor(
          requestRetry: DioConnectivityRequestRetry(
            dio: Dio(),
            connectivity: Connectivity(),
          ),
        ),
      );
    }

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (proxyEnable) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return "PROXY $proxyIP:$proxyPort";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  /// 设置headers
  void setHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

  /// 取消请求
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic> getAuthorizationHeader() {
    late Map<String, String> headers;
    // String accessToken = Global.accessToken;
    String accessToken = "";
    headers = {
      'Authorization': 'JWT $accessToken',
    };
    return headers;
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init({String? baseUrl, int? connectTimeout, int? receiveTimeout}) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    // dio.interceptors.addAll(interceptors);
  }

  /// restful get 操作
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = !cacheEnable,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(extra: {
      "refresh": refresh,
      "noCache": noCache,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    requestOptions = requestOptions.copyWith(headers: _authorization);
    Response response;
    response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    requestOptions = requestOptions.copyWith(headers: _authorization);
    var response = await dio.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }
}
