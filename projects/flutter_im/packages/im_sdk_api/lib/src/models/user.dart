/// 用户状态枚举
enum UserStatus { online, offline, busy, away }

/// 用户实体
class User {
  final String id;
  final String countryCode;
  final String phone;
  final String nickname;
  final String avatar;
  final UserStatus status;

  const User({
    required this.id,
    required this.countryCode,
    required this.phone,
    required this.nickname,
    required this.avatar,
    required this.status,
  });

  User copyWith({
    String? id,
    String? countryCode,
    String? phone,
    String? nickname,
    String? avatar,
    UserStatus? status,
  }) {
    return User(
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
      phone: phone ?? this.phone,
      nickname: nickname ?? this.nickname,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
    );
  }
}
