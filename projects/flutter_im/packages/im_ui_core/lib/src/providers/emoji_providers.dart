import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../interfaces/emoji_provider.dart';

part 'emoji_providers.g.dart';

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
@Riverpod(keepAlive: true)
IEmojiProvider? emojiProvider(Ref ref) {
  return null; // 默认无 Emoji 模块
}
