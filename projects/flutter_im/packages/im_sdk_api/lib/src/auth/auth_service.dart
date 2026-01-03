/// 认证模块接口
abstract class IAuthService {
  /// 是否有有效的 loginToken（可自动登录）
  bool get hasLoginToken;

  /// 是否有有效的 accessToken（已登录状态）
  bool get isLoggedIn;

  /// 当前用户 ID（已登录时返回）
  String? get userId;

  /// 手动登录
  /// - selectedUserId 为 null：首次登录，可能返回多用户
  /// - selectedUserId 非 null：选择用户后登录，直接返回成功
  /// - 失败：抛 AuthException
  Future<LoginResult> login(
    String countryCode,
    String phone,
    String password, {
    String? selectedUserId,
  });

  /// 注册，成功返回凭证，失败抛 AuthException
  Future<RegisterCredential> register(
    String countryCode,
    String phone,
    String password,
    String nickname,
  );

  /// 自动登录（使用 loginToken 刷新 accessToken），失败抛 AuthException
  Future<void> autoLogin();

  /// 登出（清除所有 Token）
  Future<void> logout();
}

/// 登录结果（sealed class）
sealed class LoginResult {
  const LoginResult();
}

/// 登录成功
class LoginSuccess extends LoginResult {
  final LoginCredential credential;
  const LoginSuccess(this.credential);
}

/// 需要选择用户
class LoginMultipleUsers extends LoginResult {
  final List<UserOption> users;
  const LoginMultipleUsers(this.users);
}

/// 可选用户信息
class UserOption {
  final String userId;
  final String nickname;
  final String? avatar;

  const UserOption({
    required this.userId,
    required this.nickname,
    this.avatar,
  });
}

/// 登录成功返回的凭证（SDK 内部已保存 Token）
class LoginCredential {
  final String userId;

  const LoginCredential({required this.userId});
}

/// 注册成功返回的凭证（SDK 内部已保存 Token）
class RegisterCredential {
  final String userId;

  const RegisterCredential({required this.userId});
}

/// 认证异常
class AuthException implements Exception {
  final AuthError error;

  const AuthException(this.error);

  @override
  String toString() => 'AuthException: $error';
}

/// 认证错误类型
enum AuthError {
  /// 手机号或密码错误
  invalidCredentials,

  /// 用户不存在
  userNotFound,

  /// 用户已存在
  userAlreadyExists,

  /// loginToken 过期，需重新登录
  loginTokenExpired,

  /// 网络错误
  networkError,

  /// 服务器错误
  serverError,
}
