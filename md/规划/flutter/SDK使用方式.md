# Flutter SDK 使用方式

## SDK Provider 配置

```dart
final imsdkProvider = Provider<IMSDK>((ref) {
  throw UnimplementedError('需要在 ProviderScope 中 override');
});

final authServiceProvider = Provider<IAuthService>((ref) {
  return ref.watch(imsdkProvider).authService;
});
// 其他服务同理
```

## 初始化

```dart
void main() async {
  final sdk = IMSDKImpl();
  await sdk.init(SDKConfig(appId: 'xxx', serverUrl: 'xxx'));
  
  runApp(ProviderScope(
    overrides: [imsdkProvider.overrideWithValue(sdk)],
    child: MyApp(),
  ));
}
```

## ViewModel Provider

```dart
final loginViewModelProvider = ChangeNotifierProvider<LoginViewModel>((ref) {
  return LoginViewModel(ref.watch(authServiceProvider));
});

// 带参数
final chatViewModelProvider = ChangeNotifierProvider.family<ChatViewModel, String>(
  (ref, conversationId) => ChatViewModel(
    conversationId: conversationId,
    messageService: ref.watch(messageServiceProvider),
  ),
);
```

## View 使用

```dart
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider);
    // 使用 vm.xxx 访问状态和方法
  }
}
```
