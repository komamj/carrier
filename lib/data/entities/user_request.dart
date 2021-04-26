class UserRequest {
  final String? phoneNumber;
  final String? password;
  final String? smsCode;
  final String? scope;

  UserRequest(
      {this.phoneNumber, this.password, this.smsCode, this.scope = "CARGO"});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': phoneNumber,
        'password': password,
        'scope': scope,
        'code': smsCode
      };
}
