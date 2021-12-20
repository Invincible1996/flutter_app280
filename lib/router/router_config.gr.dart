// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/index_page.dart' as _i1;
import '../pages/setting/setting_page.dart' as _i3;
import '../pages/user/login_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    IndexRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.IndexPage());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    SettingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SettingPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(IndexRoute.name, path: '/index-page'),
        _i4.RouteConfig(LoginRoute.name, path: '/'),
        _i4.RouteConfig(SettingRoute.name, path: '/setting-page')
      ];
}

/// generated route for
/// [_i1.IndexPage]
class IndexRoute extends _i4.PageRouteInfo<void> {
  const IndexRoute() : super(IndexRoute.name, path: '/index-page');

  static const String name = 'IndexRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SettingPage]
class SettingRoute extends _i4.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: '/setting-page');

  static const String name = 'SettingRoute';
}
