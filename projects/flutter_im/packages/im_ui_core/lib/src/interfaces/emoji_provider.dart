import 'package:flutter/widgets.dart';

/// Emoji 功能模块接口
///
/// 提供 Emoji 选择面板，用于聊天输入栏嵌入。
/// 当 Emoji 模块未安装时，[emojiProviderProvider] 返回 null。
///
/// 使用示例：
/// ```dart
/// final emoji = ref.watch(emojiProviderProvider);
/// if (emoji != null) {
///   emoji.buildPanel(onSelected: (e) => insertEmoji(e));
/// }
/// ```
abstract interface class IEmojiProvider {
  /// 构建 Emoji 选择面板
  Widget buildPanel({required void Function(String emoji) onSelected});

  /// 获取支持的 Emoji 列表
  List<String> get emojiList;
}
