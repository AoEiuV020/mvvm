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
  /// - 返回 true：登录成功
  /// - 返回 false：需要选择用户（检查 state.pendingUsers）或失败（检查 state.errorMessage）
  Future<bool> login();

  /// 选择用户继续登录（当 pendingUsers 非空时调用）
  Future<bool> selectUserAndContinue(String userId);

  /// 取消用户选择
  void cancelUserSelection();
}
