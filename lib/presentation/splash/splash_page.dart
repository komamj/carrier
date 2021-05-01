import 'dart:async';
import 'dart:io';

import 'package:carrier/presentation/user/user_view_model.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late Timer _timer;
  int _currentTimer = 5;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      _currentTimer--;
      if (_currentTimer < 0) {
        _timer.cancel();

        _skip();
      } else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/bg_splash.png"))),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 48, 16, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey)),
                    onPressed: _skip,
                    child:
                        Text(_currentTimer <= 0 ? "跳过" : "$_currentTimer 跳过"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("E键托付 使命必达"),
                    Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    Text(
                      "v1.0.0",
                    )
                  ],
                ),
              ),
              /* WebView(
                  initialUrl: "https://www.baidu.com/",
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  }),*/
            ],
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }

  void _skip() {
    context.read<UserViewModel>().isLogin().then((isLogin) {
      if (isLogin) {
        Navigator.pushReplacementNamed(context, Constants.homePage);
      } else {
        Navigator.pushReplacementNamed(context, Constants.loginPage);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
