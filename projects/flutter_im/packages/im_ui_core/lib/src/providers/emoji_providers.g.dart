// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Emoji 功能 Provider
///
/// 当 Emoji 模块安装时，在 ProviderScope 中 override：
/// ```dart
/// ProviderScope(
///   overrides: [
///     emojiProviderProvider.overrideWithValue(EmojiProviderImpl()),
///   ],
///   child: MyApp(),
/// )
/// ```
///
/// 未安装时返回 null，聊天输入栏据此决定是否显示 Emoji 按钮。

@ProviderFor(emojiProvider)
final emojiProviderProvider = EmojiProviderProvider._();

/// Emoji 功能 Provider
///
/// 当 Emoji 模块安装时，在 ProviderScope 中 override：
/// ```dart
/// ProviderScope(
///   overrides: [
///     emojiProviderProvider.overrideWithValue(EmojiProviderImpl()),
///   ],
///   child: MyApp(),
/// )
/// ```
///
/// 未安装时返回 null，聊天输入栏据此决定是否显示 Emoji 按钮。

final class EmojiProviderProvider
    extends
        $FunctionalProvider<IEmojiProvider?, IEmojiProvider?, IEmojiProvider?>
    with $Provider<IEmojiProvider?> {
  /// Emoji 功能 Provider
  ///
  /// 当 Emoji 模块安装时，在 ProviderScope 中 override：
  /// ```dart
  /// ProviderScope(
  ///   overrides: [
  ///     emojiProviderProvider.overrideWithValue(EmojiProviderImpl()),
  ///   ],
  ///   child: MyApp(),
  /// )
  /// ```
  ///
  /// 未安装时返回 null，聊天输入栏据此决定是否显示 Emoji 按钮。
  EmojiProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emojiProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emojiProviderHash();

  @$internal
  @override
  $ProviderElement<IEmojiProvider?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IEmojiProvider? create(Ref ref) {
    return emojiProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IEmojiProvider? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IEmojiProvider?>(value),
    );
  }
}

String _$emojiProviderHash() => r'c033cccfc04e5fa192b8ef1587c1b409d98ea89b';
