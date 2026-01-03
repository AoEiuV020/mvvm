import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:im_sdkui/im_sdkui.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_page_test.mocks.dart';

@GenerateMocks([IAuthService])
void main() {
  late MockIAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockIAuthService();
  });

  setUpAll(() {
    provideDummy<LoginResult>(
      const LoginSuccess(LoginCredential(userId: 'dummy')),
    );
  });

  Widget buildTestWidget({
    VoidCallback? onLoginSuccess,
    VoidCallback? onRegisterTap,
    VoidCallback? onForgotPasswordTap,
  }) {
    return ProviderScope(
      overrides: [
        imsdkProvider.overrideWithValue(_MockIMSDK(mockAuthService)),
      ],
      child: MaterialApp(
        home: LoginPage(
          onLoginSuccess: onLoginSuccess ?? () {},
          onRegisterTap: onRegisterTap ?? () {},
          onForgotPasswordTap: onForgotPasswordTap ?? () {},
        ),
      ),
    );
  }

  group('LoginPage Widget Tests', () {
    testWidgets('renders login form elements', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.text('手机号'), findsOneWidget);
      expect(find.text('密码'), findsOneWidget);
      expect(find.text('登录'), findsOneWidget);
      expect(find.text('忘记密码'), findsOneWidget);
      expect(find.text('注册账号'), findsOneWidget);
    });

    testWidgets('login button is disabled when form is empty', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      final loginButton = find.widgetWithText(ElevatedButton, '登录');
      final button = tester.widget<ElevatedButton>(loginButton);
      expect(button.onPressed, isNull);
    });

    testWidgets('login button is enabled when form is valid', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      // 输入有效手机号
      await tester.enterText(
        find.widgetWithText(TextField, '手机号'),
        '13812345678',
      );
      await tester.pump();

      // 输入有效密码
      await tester.enterText(
        find.widgetWithText(TextField, '密码'),
        'password123',
      );
      await tester.pump();

      final loginButton = find.widgetWithText(ElevatedButton, '登录');
      final button = tester.widget<ElevatedButton>(loginButton);
      expect(button.onPressed, isNotNull);
    });

    testWidgets('shows phone error for invalid phone', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.enterText(
        find.widgetWithText(TextField, '手机号'),
        '123',
      );
      await tester.pump();

      expect(find.text('手机号格式错误'), findsOneWidget);
    });

    testWidgets('shows password error for short password', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.enterText(
        find.widgetWithText(TextField, '密码'),
        '12345',
      );
      await tester.pump();

      expect(find.text('密码至少6位'), findsOneWidget);
    });

    testWidgets('toggles password visibility', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      // 初始状态密码不可见
      final passwordField = tester.widget<TextField>(
        find.widgetWithText(TextField, '密码'),
      );
      expect(passwordField.obscureText, isTrue);

      // 点击眼睛图标
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // 密码变为可见
      final passwordFieldAfter = tester.widget<TextField>(
        find.widgetWithText(TextField, '密码'),
      );
      expect(passwordFieldAfter.obscureText, isFalse);
    });

    testWidgets('calls onLoginSuccess when login succeeds', (tester) async {
      var loginSuccessCalled = false;

      when(
        mockAuthService.login('+86', '13812345678', 'password123'),
      ).thenAnswer(
        (_) async => const LoginSuccess(LoginCredential(userId: 'user123')),
      );

      await tester.pumpWidget(buildTestWidget(
        onLoginSuccess: () => loginSuccessCalled = true,
      ));

      await tester.enterText(
        find.widgetWithText(TextField, '手机号'),
        '13812345678',
      );
      await tester.enterText(
        find.widgetWithText(TextField, '密码'),
        'password123',
      );
      await tester.pump();

      await tester.tap(find.widgetWithText(ElevatedButton, '登录'));
      await tester.pumpAndSettle();

      expect(loginSuccessCalled, isTrue);
    });

    testWidgets('shows snackbar on login error', (tester) async {
      when(
        mockAuthService.login(any, any, any),
      ).thenThrow(const AuthException(AuthError.invalidCredentials));

      await tester.pumpWidget(buildTestWidget());

      await tester.enterText(
        find.widgetWithText(TextField, '手机号'),
        '13812345678',
      );
      await tester.enterText(
        find.widgetWithText(TextField, '密码'),
        'wrongpass1',
      );
      await tester.pump();

      await tester.tap(find.widgetWithText(ElevatedButton, '登录'));
      await tester.pumpAndSettle();

      expect(find.text('手机号或密码错误'), findsOneWidget);
    });

    testWidgets('shows user selection dialog for multiple users',
        (tester) async {
      final users = [
        const UserOption(userId: 'user1', nickname: '用户一'),
        const UserOption(userId: 'user2', nickname: '用户二'),
      ];

      when(
        mockAuthService.login('+86', '13812345678', 'password123'),
      ).thenAnswer((_) async => LoginMultipleUsers(users));

      await tester.pumpWidget(buildTestWidget());

      await tester.enterText(
        find.widgetWithText(TextField, '手机号'),
        '13812345678',
      );
      await tester.enterText(
        find.widgetWithText(TextField, '密码'),
        'password123',
      );
      await tester.pump();

      await tester.tap(find.widgetWithText(ElevatedButton, '登录'));
      await tester.pumpAndSettle();

      // 验证弹窗显示
      expect(find.text('选择账号'), findsOneWidget);
      expect(find.text('用户一'), findsOneWidget);
      expect(find.text('用户二'), findsOneWidget);
    });

    testWidgets('calls onRegisterTap when register is tapped', (tester) async {
      var registerTapped = false;

      await tester.pumpWidget(buildTestWidget(
        onRegisterTap: () => registerTapped = true,
      ));

      await tester.tap(find.text('注册账号'));
      await tester.pump();

      expect(registerTapped, isTrue);
    });

    testWidgets('calls onForgotPasswordTap when forgot password is tapped',
        (tester) async {
      var forgotPasswordTapped = false;

      await tester.pumpWidget(buildTestWidget(
        onForgotPasswordTap: () => forgotPasswordTapped = true,
      ));

      await tester.tap(find.text('忘记密码'));
      await tester.pump();

      expect(forgotPasswordTapped, isTrue);
    });
  });
}

/// Mock IMSDK 实现
class _MockIMSDK implements IMSDK {
  final IAuthService _authService;

  _MockIMSDK(this._authService);

  @override
  IAuthService get authService => _authService;

  @override
  Future<void> destroy() async {}

  @override
  Future<void> init(SDKConfig config) async {}
}
