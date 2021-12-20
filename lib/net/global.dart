///
/// @date: 2021/12/20 14:30
/// @author: kevin
/// @description: dart
/// 全局配置
class Global {
  /// token
  static String accessToken = "";
  static bool retryEnable = true;

  /// 是否 release
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
}
