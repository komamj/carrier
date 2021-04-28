import 'package:flutter/material.dart';

class DriverInfoBankCardPage extends StatefulWidget {
  @override
  _DriverInfoBankCardPageState createState() => _DriverInfoBankCardPageState();
}

class _DriverInfoBankCardPageState extends State<DriverInfoBankCardPage> {
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
