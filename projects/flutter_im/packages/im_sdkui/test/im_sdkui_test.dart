import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:im_sdkui/im_sdkui.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'im_sdkui_test.mocks.dart';

@GenerateMocks([IAuthService])
void main() {
  // 为 sealed class 提供 dummy value
  setUpAll(() {
    provideDummy<LoginResult>(
      const LoginSuccess(LoginCredential(userId: 'dummy')),
    );
  });

  group('LoginValidator', () {
    test('validatePhone returns null for valid phone', () {
      expect(LoginValidator.validatePhone('13812345678'), isNull);
    });

    test('validatePhone returns error for empty phone', () {
      expect(LoginValidator.validatePhone(''), '请输入手机号');
    });

    test('validatePhone returns error for invalid phone', () {
      expect(LoginValidator.validatePhone('123'), '手机号格式错误');
      expect(LoginValidator.validatePhone('abc'), '手机号格式错误');
    });

    test('validatePassword returns null for valid password', () {
      expect(LoginValidator.validatePassword('password123'), isNull);
    });

    test('validatePassword returns error for empty password', () {
      expect(LoginValidator.validatePassword(''), '请输入密码');
    });

    test('validatePassword returns error for short password', () {
      expect(LoginValidator.validatePassword('12345'), '密码至少6位');
    });
  });

  group('LoginViewModel', () {
    late MockIAuthService mockAuthService;
    late ProviderContainer container;

    setUp(() {
      mockAuthService = MockIAuthService();
      container = ProviderContainer(
        overrides: [authServiceProvider.overrideWithValue(mockAuthService)],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is correct', () {
      final state = container.read(loginViewModelProvider);
      expect(state.countryCode, '+86');
      expect(state.phone, '');
      expect(state.password, '');
      expect(state.isLoading, false);
      expect(state.isLoginEnabled, false);
    });

    test('setPhone updates state and validates', () {
      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('13812345678');

      final state = container.read(loginViewModelProvider);
      expect(state.phone, '13812345678');
      expect(state.phoneError, isNull);
    });

    test('setPhone with invalid phone sets error', () {
      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('123');

      final state = container.read(loginViewModelProvider);
      expect(state.phoneError, '手机号格式错误');
    });

    test('setPassword updates state and validates', () {
      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPassword('password123');

      final state = container.read(loginViewModelProvider);
      expect(state.password, 'password123');
      expect(state.passwordError, isNull);
    });

    test('togglePasswordVisibility toggles state', () {
      final vm = container.read(loginViewModelProvider.notifier);
      expect(container.read(loginViewModelProvider).isPasswordVisible, false);

      vm.togglePasswordVisibility();
      expect(container.read(loginViewModelProvider).isPasswordVisible, true);

      vm.togglePasswordVisibility();
      expect(container.read(loginViewModelProvider).isPasswordVisible, false);
    });

    test('login success returns true', () async {
      when(
        mockAuthService.login('+86', '13812345678', 'password123'),
      ).thenAnswer(
        (_) async =>
            const LoginSuccess(LoginCredential(userId: 'user123')),
      );

      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('13812345678');
      vm.setPassword('password123');

      final result = await vm.login();
      expect(result, true);
      verify(
        mockAuthService.login('+86', '13812345678', 'password123'),
      ).called(1);
    });

    test('login returns multiple users sets pendingUsers', () async {
      final users = [
        const UserOption(userId: 'user1', nickname: '用户1'),
        const UserOption(userId: 'user2', nickname: '用户2'),
      ];
      when(
        mockAuthService.login('+86', '13812345678', 'password123'),
      ).thenAnswer((_) async => LoginMultipleUsers(users));

      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('13812345678');
      vm.setPassword('password123');

      final result = await vm.login();
      expect(result, false);

      final state = container.read(loginViewModelProvider);
      expect(state.pendingUsers, users);
      expect(state.errorMessage, isNull);
    });

    test('selectUserAndContinue success returns true', () async {
      when(
        mockAuthService.selectUserAndLogin('user1'),
      ).thenAnswer((_) async => const LoginCredential(userId: 'user1'));

      final vm = container.read(loginViewModelProvider.notifier);
      final result = await vm.selectUserAndContinue('user1');
      expect(result, true);
      verify(mockAuthService.selectUserAndLogin('user1')).called(1);
    });

    test('selectUserAndContinue failure sets error', () async {
      when(
        mockAuthService.selectUserAndLogin(any),
      ).thenThrow(const AuthException(AuthError.serverError));

      final vm = container.read(loginViewModelProvider.notifier);
      final result = await vm.selectUserAndContinue('user1');
      expect(result, false);

      final state = container.read(loginViewModelProvider);
      expect(state.errorMessage, '服务器错误');
    });

    test('cancelUserSelection clears pendingUsers', () async {
      final users = [
        const UserOption(userId: 'user1', nickname: '用户1'),
      ];
      when(
        mockAuthService.login('+86', '13812345678', 'password123'),
      ).thenAnswer((_) async => LoginMultipleUsers(users));

      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('13812345678');
      vm.setPassword('password123');

      await vm.login();
      expect(container.read(loginViewModelProvider).pendingUsers, isNotNull);

      vm.cancelUserSelection();
      expect(container.read(loginViewModelProvider).pendingUsers, isNull);
    });

    test('login failure returns false and sets error', () async {
      when(
        mockAuthService.login(any, any, any),
      ).thenThrow(const AuthException(AuthError.invalidCredentials));

      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('13812345678');
      vm.setPassword('wrongpass');

      final result = await vm.login();
      expect(result, false);

      final state = container.read(loginViewModelProvider);
      expect(state.errorMessage, '手机号或密码错误');
    });
  });
}
