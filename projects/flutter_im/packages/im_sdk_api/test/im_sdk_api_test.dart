import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:test/test.dart';

void main() {
  group('认证异常', () {
    test('toString返回错误类型', () {
      const exception = AuthException(AuthError.invalidCredentials);
      expect(exception.toString(), contains('invalidCredentials'));
    });

    test('error属性返回正确值', () {
      const exception = AuthException(AuthError.networkError);
      expect(exception.error, AuthError.networkError);
    });
  });

  group('登录凭证', () {
    test('使用userId创建', () {
      const credential = LoginCredential(userId: 'user123');
      expect(credential.userId, 'user123');
    });
  });
}
