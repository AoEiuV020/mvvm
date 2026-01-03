import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:im_sdkui/im_sdkui.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_viewmodel_test.mocks.dart';

@GenerateMocks([IAuthService])
void main() {
  late MockIAuthService mockAuthService;
  late ProviderContainer container;

  // 为 sealed class 提供 dummy value
  setUpAll(() {
    provideDummy<LoginResult>(
      const LoginSuccess(LoginCredential(userId: 'dummy')),
    );
  });

  setUp(() {
    mockAuthService = MockIAuthService();
    container = ProviderContainer(
      overrides: [authServiceProvider.overrideWithValue(mockAuthService)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('登录ViewModel', () {
    test('初始状态正确', () {
      final state = container.read(loginViewModelProvider);
      expect(state.countryCode, '+86');
      expect(state.phone, '');
      expect(state.password, '');
      expect(state.isLoading, false);
      expect(state.isLoginEnabled, false);
    });

    test('设置手机号更新状态并验证', () {
      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('13812345678');

      final state = container.read(loginViewModelProvider);
      expect(state.phone, '13812345678');
      expect(state.phoneError, isNull);
    });

    test('设置无效手机号显示错误', () {
      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPhone('123');

      final state = container.read(loginViewModelProvider);
      expect(state.phoneError, '手机号格式错误');
    });

    test('设置密码更新状态并验证', () {
      final vm = container.read(loginViewModelProvider.notifier);
      vm.setPassword('password123');

      final state = container.read(loginViewModelProvider);
      expect(state.password, 'password123');
      expect(state.passwordError, isNull);
    });

    test('切换密码可见性', () {
      final vm = container.read(loginViewModelProvider.notifier);
      expect(container.read(loginViewModelProvider).isPasswordVisible, false);

      vm.togglePasswordVisibility();
      expect(container.read(loginViewModelProvider).isPasswordVisible, true);

      vm.togglePasswordVisibility();
      expect(container.read(loginViewModelProvider).isPasswordVisible, false);
    });

    test('登录成功返回true', () async {
      when(
        mockAuthService.login('+86', '13812345678', 'password123'),
      ).thenAnswer(
        (_) async => const LoginSuccess(LoginCredential(userId: 'user123')),
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

    test('登录返回多用户时设置pendingUsers', () async {
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

    test('选择用户继续登录成功返回true', () async {
      // 先触发登录获取多用户，再选择用户继续
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

      // 设置选择用户后的返回值
      when(
        mockAuthService.login(
          '+86',
          '13812345678',
          'password123',
          selectedUserId: 'user1',
        ),
      ).thenAnswer(
        (_) async => const LoginSuccess(LoginCredential(userId: 'user1')),
      );

      final result = await vm.selectUserAndContinue('user1');
      expect(result, true);
      verify(
        mockAuthService.login(
          '+86',
          '13812345678',
          'password123',
          selectedUserId: 'user1',
        ),
      ).called(1);
    });

    test('选择用户继续登录失败设置错误', () async {
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

      when(
        mockAuthService.login(
          '+86',
          '13812345678',
          'password123',
          selectedUserId: 'user1',
        ),
      ).thenThrow(const AuthException(AuthError.serverError));

      final result = await vm.selectUserAndContinue('user1');
      expect(result, false);

      final state = container.read(loginViewModelProvider);
      expect(state.errorMessage, '服务器错误');
    });

    test('取消用户选择清空pendingUsers', () async {
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

    test('登录失败返回false并设置错误', () async {
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
