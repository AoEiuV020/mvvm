import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/sdk_providers.dart';
import 'login_state.dart';
import 'login_validator.dart';
import 'login_viewmodel_interface.dart';

part 'login_viewmodel.g.dart';

/// 登录 ViewModel 实现
@riverpod
class LoginViewModel extends _$LoginViewModel implements ILoginViewModel {
  @override
  LoginState build() => const LoginState();

  IAuthService get _authService => ref.read(authServiceProvider);

  @override
  void setCountryCode(String value) {
    state = state.copyWith(countryCode: value, errorMessage: null);
  }

  @override
  void setPhone(String value) {
    state = state.copyWith(
      phone: value,
      phoneError: LoginValidator.validatePhone(value),
      errorMessage: null,
    );
  }

  @override
  void setPassword(String value) {
    state = state.copyWith(
      password: value,
      passwordError: LoginValidator.validatePassword(value),
      errorMessage: null,
    );
  }

  @override
  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  @override
  void clearError() {
    state = state.copyWith(errorMessage: null, pendingUsers: null);
  }

  @override
  Future<bool> login() async {
    if (!state.isLoginEnabled) return false;

    state = state.copyWith(isLoading: true, errorMessage: null, pendingUsers: null);

    try {
      final result = await _authService.login(state.countryCode, state.phone, state.password);
      switch (result) {
        case LoginSuccess():
          state = state.copyWith(isLoading: false);
          return true;
        case LoginMultipleUsers(:final users):
          state = state.copyWith(isLoading: false, pendingUsers: users);
          return false;
      }
    } on AuthException catch (e) {
      final message = _mapAuthError(e.error);
      state = state.copyWith(isLoading: false, errorMessage: message);
      return false;
    }
  }

  @override
  Future<bool> selectUserAndContinue(String userId) async {
    state = state.copyWith(isLoading: true, pendingUsers: null);

    try {
      await _authService.selectUserAndLogin(userId);
      state = state.copyWith(isLoading: false);
      return true;
    } on AuthException catch (e) {
      final message = _mapAuthError(e.error);
      state = state.copyWith(isLoading: false, errorMessage: message);
      return false;
    }
  }

  @override
  void cancelUserSelection() {
    state = state.copyWith(pendingUsers: null);
  }

  String _mapAuthError(AuthError error) {
    switch (error) {
      case AuthError.invalidCredentials:
        return '手机号或密码错误';
      case AuthError.userNotFound:
        return '用户不存在';
      case AuthError.networkError:
        return '网络连接失败';
      case AuthError.serverError:
        return '服务器错误';
      case AuthError.loginTokenExpired:
        return '登录已过期';
      case AuthError.userAlreadyExists:
        return '用户已存在';
    }
  }
}
