import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';
import 'login_viewmodel.dart';

/// 登录页面
class LoginPage extends ConsumerWidget {
  /// 登录成功回调
  final VoidCallback onLoginSuccess;

  /// 点击注册回调
  final VoidCallback onRegisterTap;

  /// 点击忘记密码回调
  final VoidCallback onForgotPasswordTap;

  const LoginPage({
    super.key,
    required this.onLoginSuccess,
    required this.onRegisterTap,
    required this.onForgotPasswordTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final vm = ref.read(loginViewModelProvider.notifier);

    // 监听错误消息显示 Toast
    ref.listen(loginViewModelProvider.select((s) => s.errorMessage), (_, errorMessage) {
      if (errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const FlutterLogo(size: 80),
              const SizedBox(height: 48),

              // 区号 + 手机号
              Row(
                children: [
                  // 区号选择
                  SizedBox(
                    width: 80,
                    child: DropdownButtonFormField<String>(
                      value: state.countryCode,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      items: const [
                        DropdownMenuItem(value: '+86', child: Text('+86')),
                        DropdownMenuItem(value: '+1', child: Text('+1')),
                      ],
                      onChanged: (value) {
                        if (value != null) vm.setCountryCode(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 手机号输入
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: '手机号',
                        border: const OutlineInputBorder(),
                        errorText: state.phoneError,
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: vm.setPhone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 密码输入
              TextField(
                decoration: InputDecoration(
                  labelText: '密码',
                  border: const OutlineInputBorder(),
                  errorText: state.passwordError,
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: vm.togglePasswordVisibility,
                  ),
                ),
                obscureText: !state.isPasswordVisible,
                onChanged: vm.setPassword,
              ),
              const SizedBox(height: 24),

              // 登录按钮
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.isLoginEnabled
                      ? () async {
                          final success = await vm.login();
                          if (success && context.mounted) {
                            onLoginSuccess();
                          }
                        }
                      : null,
                  child: state.isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('登录'),
                ),
              ),
              const SizedBox(height: 16),

              // 底部链接
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: onForgotPasswordTap,
                    child: const Text('忘记密码'),
                  ),
                  TextButton(
                    onPressed: onRegisterTap,
                    child: const Text('注册账号'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
