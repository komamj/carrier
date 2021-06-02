class SmsCodeRequest {
  final String phoneNumber;
  final String? template;

  SmsCodeRequest({this.phoneNumber = "", this.template = "SHIPMENT"});

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'phone': phoneNumber, 'template': template};
}
