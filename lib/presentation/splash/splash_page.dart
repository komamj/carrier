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
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/bg_splash.png"))),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 48, 16, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey)),
                  onPressed: _skip,
                  child: Text(_currentTimer <= 0 ? "跳过" : "$_currentTimer 跳过"),
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
    if (context.read<UserViewModel>().isLogin()) {
      Navigator.pushReplacementNamed(context, Constants.homePage);
    } else {
      Navigator.pushReplacementNamed(context, Constants.loginPage);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
