import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../interfaces/enterprise_provider.dart';

part 'enterprise_providers.g.dart';

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
@Riverpod(keepAlive: true)
IEnterpriseProvider? enterpriseProvider(Ref ref) {
  return null; // 默认无企业模块
}
