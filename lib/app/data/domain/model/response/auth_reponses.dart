class CheckUsernameResponse {
  final bool exist;
  final String code;

  CheckUsernameResponse(
    this.exist,
    this.code,
  );

  static CheckUsernameResponse fromJson(Map<String, dynamic> json) {
    return CheckUsernameResponse(
      json['exist'],
      json['code'],
    );
  }
}

class LoginResponse {
  final Token token;
  final String code;

  LoginResponse(
    this.token,
    this.code,
  );

  static LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      Token.fromJson(json['token']),
      json['code'],
    );
  }
}

class Token {
  final String token;
  final String refreshToken;
  final int validUntil;

  Token(
    this.token,
    this.refreshToken,
    this.validUntil,
  );

  static Token fromJson(Map<String, dynamic> json) {
    return Token(
      json['token'],
      json['refreshToken'],
      json['validUntil'],
    );
  }
}

class GetUserInfoResponse {
  final UserInfo info;
  final String code;

  GetUserInfoResponse(
    this.info,
    this.code,
  );

  static GetUserInfoResponse fromJson(Map<String, dynamic> json) {
    return GetUserInfoResponse(
      UserInfo.fromJson(json['info']),
      json['code'],
    );
  }
}

class UserInfo {
  final String username;
  final String firstName;
  final String lastName;
  final int gender;
  final DateTime lastSeen;
  final bool isStaff;

  UserInfo(
    this.username,
    this.firstName,
    this.lastName,
    this.gender,
    this.lastSeen,
    this.isStaff,
  );

  static UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo(
      json['username'],
      json['first_name'],
      json['last_name'],
      json['gender'],
      DateTime.parse(json['last_seen']),
      json['is_staff'],
    );
  }
}
