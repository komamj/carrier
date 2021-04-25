import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlatformAgreementPage extends StatefulWidget {
  @override
  _PlatformAgreementPageState createState() => _PlatformAgreementPageState();
}

class _PlatformAgreementPageState extends State<PlatformAgreementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "平台协议",
          //style: TextStyle(color: Colors.black54),
        ),
        //backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
            child: WebView(
          initialUrl: "https://www.51ejd.com/userAgreement",
        )),
      ),
    );
  }
}
