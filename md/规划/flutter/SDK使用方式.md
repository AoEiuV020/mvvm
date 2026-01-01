# Flutter SDK 使用方式

## SDK Provider 配置

```dart
@riverpod
IMSDK imsdk(Ref ref) {
  throw UnimplementedError('需要在 ProviderScope 中 override');
}

@riverpod
IAuthService authService(Ref ref) => ref.watch(imsdkProvider).authService;

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
@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();
  
  IAuthService get _authService => ref.read(authServiceProvider);
  
  Future<bool> login() async {
    state = state.copyWith(isLoading: true);
    final result = await _authService.login(state.username, state.password);
    state = state.copyWith(isLoading: false);
    return result.success;
  }
}
```

## View 使用

```dart
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final vm = ref.read(loginViewModelProvider.notifier);
    // 使用 state.xxx 和 vm.xxx()
  }
}
```
