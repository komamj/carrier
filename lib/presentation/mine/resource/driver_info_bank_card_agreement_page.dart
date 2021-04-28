import 'package:flutter/material.dart';

class DriverInfoBankCardAgreementPage extends StatefulWidget {
  @override
  _DriverInfoBankCardAgreementPageState createState() =>
      _DriverInfoBankCardAgreementPageState();
}

class _DriverInfoBankCardAgreementPageState
    extends State<DriverInfoBankCardAgreementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "服务协议",
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("内容"),
      ),
    );
  }
}
