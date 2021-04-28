import 'package:flutter/material.dart';

class DriverInfoBankCardInfoPage extends StatefulWidget {
  @override
  _DriverInfoBankCardInfoPageState createState() =>
      _DriverInfoBankCardInfoPageState();
}

class _DriverInfoBankCardInfoPageState
    extends State<DriverInfoBankCardInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "银行卡",
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
