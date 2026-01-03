import 'auth/auth_service.dart';

/// SDK 配置
class SDKConfig {
  final String appId;
  final String serverUrl;

  const SDKConfig({
    required this.appId,
    required this.serverUrl,
  });
}

/// IM SDK 主接口
/// 
/// SDK 是一个整体，所有服务通过 SDK 实例获取。
/// App 层只需 override imsdkProvider，不需要单独 override 各个 Service Provider。
abstract class IMSDK {
  /// 初始化 SDK
  Future<void> init(SDKConfig config);

  /// 认证服务
  IAuthService get authService;

  // TODO: 添加其他服务
  // ISyncService get syncService;
  // IConnectionService get connectionService;
  // IUserService get userService;
  // IConversationService get conversationService;
  // IMessageService get messageService;
  // IContactService get contactService;

  /// 销毁 SDK
  Future<void> destroy();
}
