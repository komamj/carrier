class UserResponse {
  final String? accessToken;
  final String? tokenType;
  final String? refreshToken;
  final String? nickName;
  final String? avatar;

  UserResponse(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.nickName,
      this.avatar});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        accessToken: json['accessToken'],
        tokenType: json['tokenType'],
        refreshToken: json['refreshToken'],
        nickName: json['nickName'],
        avatar: json['portraitDentryid']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nickName': nickName,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'tokenType': tokenType,
        'avatar': avatar
      };
}
