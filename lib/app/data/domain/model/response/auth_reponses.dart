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
