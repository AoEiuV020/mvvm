import 'package:go_router/go_router.dart';
import 'package:im_login/im_login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// 应用路由配置
///
/// 统一管理所有功能模块的路由。
/// 使用时需要在 ProviderScope 中 override：
/// ```dart
/// ProviderScope(
///   overrides: [
///     imsdkProvider.overrideWithValue(sdkImpl),
///     appRouterProvider.overrideWith((ref) => createAppRouter(
///       onLoginSuccess: () => context.go('/home'),
///     )),
///   ],
///   child: MyApp(),
/// )
/// ```
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  throw UnimplementedError('appRouterProvider must be overridden');
}

/// 创建应用路由
///
/// [onLoginSuccess] 登录成功后的回调（跳转到主页）
GoRouter createAppRouter({
  required void Function() onLoginSuccess,
}) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(
          onLoginSuccess: onLoginSuccess,
          onRegisterTap: () => GoRouter.of(context).go('/register'),
          onForgotPasswordTap: () {
            // TODO: 添加忘记密码模块后跳转
          },
        ),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}
