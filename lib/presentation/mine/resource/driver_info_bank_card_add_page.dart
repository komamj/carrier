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
        color: Colors.blue[50],
        child: Align(
          // 不显式指定宽高，通过同时指定widthFactor和heightFactor 为2也是可以达到同样的效果：2*60=120
          alignment: Alignment.topRight,
          // FlutterLogo 是Flutter SDK提供的一个组件，内容就是Flutter的商标。
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
