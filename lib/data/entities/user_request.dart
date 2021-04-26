import 'dart:convert';

import 'package:crypto/crypto.dart';

class UserRequest {
  final String phoneNumber;
  final String password;
  final String smsCode;
  final String? scope;

  UserRequest(
      {this.phoneNumber = "",
      this.password = "",
      this.smsCode = "",
      this.scope = "CARGO"});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': phoneNumber,
        'password': _generateMd5(password),
        'scope': scope,
        'code': smsCode
      };

  // md5 加密
  String _generateMd5(String data) {
    return md5.convert(utf8.encode(data)).toString();
  }
}
