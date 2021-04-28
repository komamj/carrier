import 'package:flutter/material.dart';

class DriverInfoBankCardAddPage extends StatefulWidget {
  @override
  _DriverInfoBankCardAddPageState createState() =>
      _DriverInfoBankCardAddPageState();
}

class _DriverInfoBankCardAddPageState extends State<DriverInfoBankCardAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "添加银行卡",
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
