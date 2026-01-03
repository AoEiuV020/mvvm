// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 应用路由配置
///
/// 统一管理所有功能模块的路由。
/// 使用时需要提供导航回调：
/// ```dart
/// ProviderScope(
///   overrides: [
///     appRouterProvider.overrideWith((ref) => createAppRouter(
///       onLoginSuccess: () => ref.read(appRouterProvider).go('/home'),
///     )),
///   ],
///   child: MyApp(),
/// )
/// ```

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// 应用路由配置
///
/// 统一管理所有功能模块的路由。
/// 使用时需要提供导航回调：
/// ```dart
/// ProviderScope(
///   overrides: [
///     appRouterProvider.overrideWith((ref) => createAppRouter(
///       onLoginSuccess: () => ref.read(appRouterProvider).go('/home'),
///     )),
///   ],
///   child: MyApp(),
/// )
/// ```

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// 应用路由配置
  ///
  /// 统一管理所有功能模块的路由。
  /// 使用时需要提供导航回调：
  /// ```dart
  /// ProviderScope(
  ///   overrides: [
  ///     appRouterProvider.overrideWith((ref) => createAppRouter(
  ///       onLoginSuccess: () => ref.read(appRouterProvider).go('/home'),
  ///     )),
  ///   ],
  ///   child: MyApp(),
  /// )
  /// ```
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'fcdb532b9f350b67ad226750b9c14f6efbcc21a9';
