import 'login_state.dart';

/// 登录 ViewModel 接口
abstract class ILoginViewModel {
  /// 当前状态
  LoginState get state;

  /// 设置区号
  void setCountryCode(String value);

  /// 设置手机号
  void setPhone(String value);

  /// 设置密码
  void setPassword(String value);

  /// 切换密码可见性
  void togglePasswordVisibility();

  /// 清除错误
  void clearError();

  /// 登录
  Future<bool> login();
}
