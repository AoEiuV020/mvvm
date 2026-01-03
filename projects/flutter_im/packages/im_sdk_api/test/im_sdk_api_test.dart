import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:test/test.dart';

void main() {
  group('AuthException', () {
    test('toString returns error type', () {
      const exception = AuthException(AuthError.invalidCredentials);
      expect(exception.toString(), contains('invalidCredentials'));
    });

    test('error property returns correct value', () {
      const exception = AuthException(AuthError.networkError);
      expect(exception.error, AuthError.networkError);
    });
  });

  group('LoginCredential', () {
    test('creates with userId', () {
      const credential = LoginCredential(userId: 'user123');
      expect(credential.userId, 'user123');
    });
  });
}
