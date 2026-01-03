import 'package:flutter_test/flutter_test.dart';
import 'package:im_login/im_login.dart';

void main() {
  group('登录验证器', () {
    test('有效手机号返回null', () {
      expect(LoginValidator.validatePhone('13812345678'), isNull);
    });

    test('空手机号返回错误', () {
      expect(LoginValidator.validatePhone(''), '请输入手机号');
    });

    test('无效手机号返回错误', () {
      expect(LoginValidator.validatePhone('123'), '手机号格式错误');
      expect(LoginValidator.validatePhone('abc'), '手机号格式错误');
    });

    test('有效密码返回null', () {
      expect(LoginValidator.validatePassword('password123'), isNull);
    });

    test('空密码返回错误', () {
      expect(LoginValidator.validatePassword(''), '请输入密码');
    });

    test('短密码返回错误', () {
      expect(LoginValidator.validatePassword('12345'), '密码至少6位');
    });
  });
}
