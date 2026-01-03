# Flutter SDK 使用方式

## SDK Provider 配置

```dart
/// SDK 主 Provider（唯一需要 override 的）
@Riverpod(keepAlive: true)
IMSDK imsdk(Ref ref) {
  throw UnimplementedError('需要在 ProviderScope 中 override');
}

/// Service Provider（派生自 SDK，使用 ref.read）
@Riverpod(keepAlive: true)
IAuthService authService(Ref ref) => ref.read(imsdkProvider).authService;

// 其他服务同理
```

**说明：**
- 只需 override `imsdkProvider`，各 Service Provider 自动派生
- 使用 `ref.read` 而非 `ref.watch`，因为 SDK 不会变化

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
    final result = await _authService.login(state.countryCode, state.phone, state.password);
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
