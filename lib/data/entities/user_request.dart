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
      this.scope = "PLATFORM"});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': phoneNumber,
        'password': _generateMd5(password),
        'scope': scope,
        'code': smsCode
      };

  // md5 加密
  String _generateMd5(String data) {
    String content = "\x8f\x70\x83\x8f2eh1.iaqw7$data";
    return md5.convert(utf8.encode(content)).toString();
  }
}
