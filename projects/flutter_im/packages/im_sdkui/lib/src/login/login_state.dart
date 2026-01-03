import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:im_sdk_api/im_sdk_api.dart';

part 'login_state.freezed.dart';

/// 登录页面状态
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default('+86') String countryCode,
    @Default('') String phone,
    String? phoneError,
    @Default('') String password,
    String? passwordError,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isLoading,
    String? errorMessage,
    /// 待选用户列表（非空时表示需要用户选择）
    List<UserOption>? pendingUsers,
  }) = _LoginState;
}

/// 扩展方法
extension LoginStateX on LoginState {
  /// 是否可以登录
  bool get isLoginEnabled =>
      phone.isNotEmpty &&
      password.isNotEmpty &&
      phoneError == null &&
      passwordError == null &&
      !isLoading;
}
