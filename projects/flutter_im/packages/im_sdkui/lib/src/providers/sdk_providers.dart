import 'package:im_sdk_api/im_sdk_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sdk_providers.g.dart';

/// AuthService Provider
/// 
/// 使用时需要在 ProviderScope 中 override 此 Provider：
/// ```dart
/// ProviderScope(
///   overrides: [
///     authServiceProvider.overrideWithValue(authServiceImpl),
///   ],
///   child: MyApp(),
/// )
/// ```
@Riverpod(keepAlive: true)
IAuthService authService(AuthServiceRef ref) {
  throw UnimplementedError('authServiceProvider must be overridden');
}
