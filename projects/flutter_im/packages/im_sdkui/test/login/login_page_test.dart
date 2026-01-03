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

  group('登录页Widget测试', () {
    testWidgets('渲染登录表单元素', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      expect(find.text('手机号'), findsOneWidget);
      expect(find.text('密码'), findsOneWidget);
      expect(find.text('登录'), findsOneWidget);
      expect(find.text('忘记密码'), findsOneWidget);
      expect(find.text('注册账号'), findsOneWidget);
    });

    testWidgets('表单为空时登录按钮禁用', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      final loginButton = find.widgetWithText(ElevatedButton, '登录');
      final button = tester.widget<ElevatedButton>(loginButton);
      expect(button.onPressed, isNull);
    });

    testWidgets('表单有效时登录按钮启用', (tester) async {
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

    testWidgets('无效手机号显示错误', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.enterText(
        find.widgetWithText(TextField, '手机号'),
        '123',
      );
      await tester.pump();

      expect(find.text('手机号格式错误'), findsOneWidget);
    });

    testWidgets('短密码显示错误', (tester) async {
      await tester.pumpWidget(buildTestWidget());

      await tester.enterText(
        find.widgetWithText(TextField, '密码'),
        '12345',
      );
      await tester.pump();

      expect(find.text('密码至少6位'), findsOneWidget);
    });

    testWidgets('切换密码可见性', (tester) async {
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

    testWidgets('登录成功时回调onLoginSuccess', (tester) async {
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

    testWidgets('登录失败显示Snackbar', (tester) async {
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

    testWidgets('多用户时显示选择弹窗', (tester) async {
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

    testWidgets('点击注册回调onRegisterTap', (tester) async {
      var registerTapped = false;

      await tester.pumpWidget(buildTestWidget(
        onRegisterTap: () => registerTapped = true,
      ));

      await tester.tap(find.text('注册账号'));
      await tester.pump();

      expect(registerTapped, isTrue);
    });

    testWidgets('点击忘记密码回调onForgotPasswordTap', (tester) async {
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
