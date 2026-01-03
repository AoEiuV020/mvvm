// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 企业功能 Provider
///
/// 当企业模块安装时，在 ProviderScope 中 override：
/// ```dart
/// ProviderScope(
///   overrides: [
///     enterpriseProviderProvider.overrideWithValue(EnterpriseProviderImpl()),
///   ],
///   child: MyApp(),
/// )
/// ```
///
/// 未安装时返回 null，各页面据此决定是否显示企业相关功能。

@ProviderFor(enterpriseProvider)
final enterpriseProviderProvider = EnterpriseProviderProvider._();

/// 企业功能 Provider
///
/// 当企业模块安装时，在 ProviderScope 中 override：
/// ```dart
/// ProviderScope(
///   overrides: [
///     enterpriseProviderProvider.overrideWithValue(EnterpriseProviderImpl()),
///   ],
///   child: MyApp(),
/// )
/// ```
///
/// 未安装时返回 null，各页面据此决定是否显示企业相关功能。

final class EnterpriseProviderProvider
    extends
        $FunctionalProvider<
          IEnterpriseProvider?,
          IEnterpriseProvider?,
          IEnterpriseProvider?
        >
    with $Provider<IEnterpriseProvider?> {
  /// 企业功能 Provider
  ///
  /// 当企业模块安装时，在 ProviderScope 中 override：
  /// ```dart
  /// ProviderScope(
  ///   overrides: [
  ///     enterpriseProviderProvider.overrideWithValue(EnterpriseProviderImpl()),
  ///   ],
  ///   child: MyApp(),
  /// )
  /// ```
  ///
  /// 未安装时返回 null，各页面据此决定是否显示企业相关功能。
  EnterpriseProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enterpriseProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enterpriseProviderHash();

  @$internal
  @override
  $ProviderElement<IEnterpriseProvider?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IEnterpriseProvider? create(Ref ref) {
    return enterpriseProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IEnterpriseProvider? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IEnterpriseProvider?>(value),
    );
  }
}

String _$enterpriseProviderHash() =>
    r'59de2520847327aef2567e6c94ea9c78f95ece38';
