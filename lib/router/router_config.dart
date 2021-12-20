// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:flutter_app280/pages/index_page.dart';
import 'package:flutter_app280/pages/setting/setting_page.dart';
import 'package:flutter_app280/pages/user/login_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: IndexPage,
      // initial: true,
    ),
    AutoRoute(
      page: LoginPage,
      initial: true,
    ),
    AutoRoute(
      page: SettingPage,
    ),
  ],
)
class $AppRouter {}
