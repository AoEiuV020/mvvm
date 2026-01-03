// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authServiceHash() => r'ec9c93aad39032fc0b3f07543c17ec80ab83206c';

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
///
/// Copied from [authService].
@ProviderFor(authService)
final authServiceProvider = Provider<IAuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthServiceRef = ProviderRef<IAuthService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
