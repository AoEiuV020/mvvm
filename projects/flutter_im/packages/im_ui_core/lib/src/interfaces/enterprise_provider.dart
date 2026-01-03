import 'package:flutter/widgets.dart';

/// 企业功能模块接口
///
/// 提供企业版特有的功能，如同事列表、企业设置等。
/// 当企业模块未安装时，[enterpriseProviderProvider] 返回 null。
///
/// 使用示例：
/// ```dart
/// final enterprise = ref.watch(enterpriseProviderProvider);
/// if (enterprise != null) {
///   enterprise.buildColleagueList();
/// }
/// ```
abstract interface class IEnterpriseProvider {
  /// 构建同事列表（用于通讯录页面）
  Widget buildColleagueList();

  /// 构建企业设置入口（用于设置页面）
  Widget buildEnterpriseSettingsEntry();

  /// 构建企业信息面板（用于个人中心）
  Widget buildEnterpriseInfoPanel();
}
