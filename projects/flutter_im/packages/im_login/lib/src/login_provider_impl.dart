import 'package:flutter/widgets.dart';
import 'package:im_ui_core/im_ui_core.dart';

import 'login_page.dart';

/// 登录功能模块实现
class LoginProviderImpl implements ILoginProvider {
  /// 登录成功回调
  final VoidCallback onLoginSuccess;

  /// 点击注册回调
  final VoidCallback onRegisterTap;

  /// 点击忘记密码回调
  final VoidCallback onForgotPasswordTap;

  LoginProviderImpl({
    required this.onLoginSuccess,
    required this.onRegisterTap,
    required this.onForgotPasswordTap,
  });

  @override
  Widget buildLoginPage() {
    return LoginPage(
      onLoginSuccess: onLoginSuccess,
      onRegisterTap: onRegisterTap,
      onForgotPasswordTap: onForgotPasswordTap,
    );
  }

  @override
  Widget buildRegisterPage() {
    // TODO: 实现注册页面
    throw UnimplementedError();
  }
}
