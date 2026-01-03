// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// AuthService Provider
///
/// 使用时需要在 ProviderScope 中 override 此 Provider：
/// ```dart
/// ProviderScope(
///   overrides: [
///     authServiceProvider.overrideWithValue(authServiceImpl),
///   ],
///   child: MyApp(),
/// )
/// ```

@ProviderFor(authService)
final authServiceProvider = AuthServiceProvider._();

/// AuthService Provider
///
/// 使用时需要在 ProviderScope 中 override 此 Provider：
/// ```dart
/// ProviderScope(
///   overrides: [
///     authServiceProvider.overrideWithValue(authServiceImpl),
///   ],
///   child: MyApp(),
/// )
/// ```

final class AuthServiceProvider
    extends $FunctionalProvider<IAuthService, IAuthService, IAuthService>
    with $Provider<IAuthService> {
  /// AuthService Provider
  ///
  /// 使用时需要在 ProviderScope 中 override 此 Provider：
  /// ```dart
  /// ProviderScope(
  ///   overrides: [
  ///     authServiceProvider.overrideWithValue(authServiceImpl),
  ///   ],
  ///   child: MyApp(),
  /// )
  /// ```
  AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<IAuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthService>(value),
    );
  }
}

String _$authServiceHash() => r'd8a5f7cdc947fd42a2d6caaea793bfc87d29e2a2';
