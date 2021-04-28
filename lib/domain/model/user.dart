class User {
  String? phoneNumber;
  String? password;
  final String? nickName;
  final String? accessToken;
  final String? tokenType;
  final String? refreshToken;
  final String? avatar;

  User(
      {this.phoneNumber,
      this.password,
      this.nickName,
      this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nickName: json['nickName'],
        accessToken: json['accessToken'],
        tokenType: json['tokenType'],
        refreshToken: json['refreshToken'],
        avatar: json['portraitDentryid']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'phoneNumber': phoneNumber,
        'password': password,
        'nickName': nickName,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'tokenType': tokenType,
        'avatar': avatar
      };
}
