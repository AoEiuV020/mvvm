// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// SDK Provider
///
/// 使用时需要在 ProviderScope 中 override 此 Provider：
/// ```dart
/// ProviderScope(
///   overrides: [
///     imsdkProvider.overrideWithValue(sdkImpl),
///   ],
///   child: MyApp(),
/// )
/// ```

@ProviderFor(imsdk)
final imsdkProvider = ImsdkProvider._();

/// SDK Provider
///
/// 使用时需要在 ProviderScope 中 override 此 Provider：
/// ```dart
/// ProviderScope(
///   overrides: [
///     imsdkProvider.overrideWithValue(sdkImpl),
///   ],
///   child: MyApp(),
/// )
/// ```

final class ImsdkProvider extends $FunctionalProvider<IMSDK, IMSDK, IMSDK>
    with $Provider<IMSDK> {
  /// SDK Provider
  ///
  /// 使用时需要在 ProviderScope 中 override 此 Provider：
  /// ```dart
  /// ProviderScope(
  ///   overrides: [
  ///     imsdkProvider.overrideWithValue(sdkImpl),
  ///   ],
  ///   child: MyApp(),
  /// )
  /// ```
  ImsdkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imsdkProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imsdkHash();

  @$internal
  @override
  $ProviderElement<IMSDK> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IMSDK create(Ref ref) {
    return imsdk(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IMSDK value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IMSDK>(value),
    );
  }
}

String _$imsdkHash() => r'f8be980658ccee4335b3188babc0f7ad3797962a';

/// AuthService Provider（派生自 SDK）
///
/// 使用 ref.read 而非 ref.watch，因为：
/// 1. imsdkProvider 是 keepAlive 且不会变化
/// 2. 避免不必要的依赖追踪开销

@ProviderFor(authService)
final authServiceProvider = AuthServiceProvider._();

/// AuthService Provider（派生自 SDK）
///
/// 使用 ref.read 而非 ref.watch，因为：
/// 1. imsdkProvider 是 keepAlive 且不会变化
/// 2. 避免不必要的依赖追踪开销

final class AuthServiceProvider
    extends $FunctionalProvider<IAuthService, IAuthService, IAuthService>
    with $Provider<IAuthService> {
  /// AuthService Provider（派生自 SDK）
  ///
  /// 使用 ref.read 而非 ref.watch，因为：
  /// 1. imsdkProvider 是 keepAlive 且不会变化
  /// 2. 避免不必要的依赖追踪开销
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

String _$authServiceHash() => r'5d6cd823da086ff814737fad93cd7dc9d60d7b35';
