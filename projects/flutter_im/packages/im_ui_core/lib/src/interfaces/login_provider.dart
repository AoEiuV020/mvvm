import 'package:flutter/widgets.dart';

/// 登录功能模块接口
abstract interface class ILoginProvider {
  /// 登录页面构建器
  Widget buildLoginPage();

  /// 注册页面构建器
  Widget buildRegisterPage();
}
