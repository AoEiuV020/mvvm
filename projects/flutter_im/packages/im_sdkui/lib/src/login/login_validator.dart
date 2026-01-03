/// 登录表单校验器
class LoginValidator {
  /// 校验手机号
  static String? validatePhone(String phone) {
    if (phone.isEmpty) return '请输入手机号';
    if (!RegExp(r'^\d{11}$').hasMatch(phone)) return '手机号格式错误';
    return null;
  }

  /// 校验密码
  static String? validatePassword(String password) {
    if (password.isEmpty) return '请输入密码';
    if (password.length < 6) return '密码至少6位';
    return null;
  }
}
