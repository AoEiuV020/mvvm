import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sdk_providers.g.dart';

/// SDK Provider
///
/// 使用时需要在 ProviderScope 中 override 此 Provider：
/// ```dart
/// ProviderScope(
///   overrides: [
///     imsdkProvider.overrideWithValue(sdkImpl),
///   ],
///   child: MyApp(),
/// )
/// ```
@Riverpod(keepAlive: true)
IMSDK imsdk(Ref ref) {
  throw UnimplementedError('imsdkProvider must be overridden');
}

/// AuthService Provider（派生自 SDK）
///
/// 使用 ref.read 而非 ref.watch，因为：
/// 1. imsdkProvider 是 keepAlive 且不会变化
/// 2. 避免不必要的依赖追踪开销
@Riverpod(keepAlive: true)
IAuthService authService(Ref ref) => ref.read(imsdkProvider).authService;
