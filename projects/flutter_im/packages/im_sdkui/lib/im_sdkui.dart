/// IM SDK UI 组装层 - 功能模块注入和配置
library;

// 路由配置
export 'src/router/app_router.dart';

// 模块覆盖配置
export 'src/module_overrides.dart';

// 重新导出核心层和功能模块的公共 API
export 'package:im_ui_core/im_ui_core.dart';
export 'package:im_login/im_login.dart';
