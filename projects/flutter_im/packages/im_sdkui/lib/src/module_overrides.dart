import 'package:riverpod/misc.dart' show Override;
import 'package:im_ui_core/im_ui_core.dart';

// TODO: 当模块实现后，导入实现类
// import 'package:im_emoji/im_emoji.dart' show EmojiProviderImpl;
// import 'package:im_enterprise/im_enterprise.dart' show EnterpriseProviderImpl;

/// 模块覆盖配置
///
/// sdkui 层内部聚合所有已实现模块的 overrides。
/// App 层只需使用 [defaultOverrides] 即可自动注册所有模块。
///
/// 基础用法（使用默认配置）：
/// ```dart
/// ProviderScope(
///   overrides: defaultOverrides,
///   child: MyApp(),
/// )
/// ```
///
/// 自定义用法（替换某些模块实现）：
/// ```dart
/// ProviderScope(
///   overrides: createOverrides(
///     emoji: MyCustomEmojiProvider(),
///   ),
///   child: MyApp(),
/// )
/// ```

/// 默认模块 overrides 列表
///
/// 包含所有已安装模块的默认实现。
/// App 层直接使用此列表即可。
List<Override> get defaultOverrides {
  return createOverrides();
}

/// 创建模块 overrides 列表
///
/// [emoji] - 自定义 Emoji 模块实现，为 null 时使用默认实现
/// [enterprise] - 自定义企业模块实现，为 null 时使用默认实现
///
/// 返回 Provider 覆盖列表，用于 ProviderScope.overrides
List<Override> createOverrides({
  IEmojiProvider? emoji,
  IEnterpriseProvider? enterprise,
}) {
  // TODO: 当模块实现后，使用实际实现类
  // emoji ??= EmojiProviderImpl();
  // enterprise ??= EnterpriseProviderImpl();

  return [
    if (emoji != null) emojiProviderProvider.overrideWithValue(emoji),
    if (enterprise != null)
      enterpriseProviderProvider.overrideWithValue(enterprise),
  ];
}
