import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app280/entry/user_entry.dart';
import 'package:flutter_app280/net/api_response.dart';
import 'package:flutter_app280/net/http_util.dart';

///
/// @date: 2021/12/20 15:28
/// @author: kevin
/// @description: dart

class LoginModel {
  /// [smsCode]
  /// [phone]
  /// desc 验证码登录
  static Future<ApiResponse<UserEntry>> login(params) async {
    try {
      var response = await HttpUtils.post('/v1/api/auth/smsLogin', data: params);
      var data = UserEntry.fromJson(response);
      debugPrint(data.toJson().toString());
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
