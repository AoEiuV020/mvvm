# Flutter SDK 使用方式

## Provider 配置

### SDK Provider

```dart
// lib/providers/sdk_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imsdkProvider = Provider<IMSDK>((ref) {
  throw UnimplementedError('需要在 ProviderScope 中 override');
});

final authServiceProvider = Provider<IAuthService>((ref) {
  return ref.watch(imsdkProvider).authService;
});

final userServiceProvider = Provider<IUserService>((ref) {
  return ref.watch(imsdkProvider).userService;
});

final conversationServiceProvider = Provider<IConversationService>((ref) {
  return ref.watch(imsdkProvider).conversationService;
});

final messageServiceProvider = Provider<IMessageService>((ref) {
  return ref.watch(imsdkProvider).messageService;
});

final contactServiceProvider = Provider<IContactService>((ref) {
  return ref.watch(imsdkProvider).contactService;
});
```

---

## 初始化

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化 SDK
  final sdk = IMSDKImpl();
  await sdk.init(SDKConfig(
    appId: 'your_app_id',
    serverUrl: 'https://api.example.com',
  ));
  
  runApp(
    ProviderScope(
      overrides: [
        imsdkProvider.overrideWithValue(sdk),
      ],
      child: const MyApp(),
    ),
  );
}
```

---

## ViewModel 注入

```dart
// lib/providers/viewmodel_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider = ChangeNotifierProvider<LoginViewModel>((ref) {
  return LoginViewModel(ref.watch(authServiceProvider));
});

final chatViewModelProvider = ChangeNotifierProvider.family<ChatViewModel, String>(
  (ref, conversationId) {
    return ChatViewModel(
      conversationId: conversationId,
      messageService: ref.watch(messageServiceProvider),
      conversationService: ref.watch(conversationServiceProvider),
    );
  },
);
```

---

## View 中使用

```dart
// lib/views/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider);
    
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: vm.setUsername,
          ),
          TextField(
            onChanged: vm.setPassword,
            obscureText: !vm.isPasswordVisible,
          ),
          if (vm.errorMessage != null)
            Text(vm.errorMessage!, style: TextStyle(color: Colors.red)),
          ElevatedButton(
            onPressed: vm.isLoginEnabled ? () => _handleLogin(context, vm) : null,
            child: vm.isLoading 
              ? CircularProgressIndicator() 
              : Text('登录'),
          ),
        ],
      ),
    );
  }
  
  Future<void> _handleLogin(BuildContext context, LoginViewModel vm) async {
    final success = await vm.login();
    if (success && context.mounted) {
      context.go('/conversations');
    }
  }
}
```
