import 'package:flutter/material.dart';
import 'package:flutter_app280/net/http_util.dart';
import 'package:flutter_app280/router/router_config.gr.dart';
import 'package:flutter_app280/style/m_colors.dart';

void main() {
  HttpUtils.init(baseUrl: 'http://t-portal.visioneschool.com');
  runApp(MyApp());
}

enum System {
  windows,
  linux,
  macos,
}

enum HttpStatus {
  success,
  error,
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MColors.primaryColor,
        fontFamily: 'Noto',
      ),
    );
  }
}
