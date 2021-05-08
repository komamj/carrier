class User {
  String? phoneNumber;
  String? password;
  final String? nickName;
  final String? accessToken;
  final String? tokenType;
  final String? refreshToken;
  final String? avatar;
  final int? organizationId; //机构id(机构id为空则表示该用户为新用户)
  final String? organizationName; // 机构名称
  final int?
      organizationType; // 机构类型(1.平台;2.运营方;3.货权方;4.货主;5.承运商;6.供应商;7.客户)(机构类型为空则为新注册司机;机构id为空，机构类型不为空则为新注册机构)
  final int? auditStatus; //审核状态(0.认证失败;1.已认证;2.待认证;null:未填资料)
  final int? accountType; //账号类型(1.主账号，2.司机账号，3.机构下普通账户)

  User(
      {this.phoneNumber,
      this.password,
      this.nickName,
      this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.avatar,
      this.organizationId,
      this.organizationName,
      this.organizationType,
      this.auditStatus,
      this.accountType});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nickName: json['nickName'],
        accessToken: json['accessToken'],
        tokenType: json['tokenType'],
        refreshToken: json['refreshToken'],
        avatar: json['portraitDentryid'],
        organizationId: json['organizationId'],
        organizationName: json['organizationName'],
        organizationType: json['organizationType'],
        auditStatus: json['auditStatus'],
        accountType: json['accountType']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'phoneNumber': phoneNumber,
        'password': password,
        'nickName': nickName,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'tokenType': tokenType,
        'avatar': avatar,
        'organizationId': organizationId,
        'organizationName': organizationName,
        'organizationType': organizationType,
        'auditStatus': auditStatus,
        'accountType': accountType
      };
}
