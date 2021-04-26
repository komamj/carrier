import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';

import '../../../util/constants.dart';

class EditUserNewPhonePage extends StatefulWidget {
  @override
  _EditUserNewPhonePageState createState() => _EditUserNewPhonePageState();
}

class _EditUserNewPhonePageState extends State<EditUserNewPhonePage> {
  late Timer _timer;
  int _currentTimer = 60;

  String _smsBtnName = "获取验证码";

  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();
  final TextEditingController _smsController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isGo = false;
  bool isGoSendSms = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      print(_phoneController.text);
      if (_phoneController.text.length == 11) {
        isGoSendSms = true;
      } else {
        isGoSendSms = false;
      }
      setState(() {});
    });

    _smsController.addListener(() {
      print(_smsController.text);
      if (_smsController.text.length == 6) {
        isGo = true;
      } else {
        isGo = false;
      }
      setState(() {});
    });
  }

  _showToast() {
    Fluttertoast.showToast(
        msg: '短信验证码已发送，请注意查收',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _time() {
    _showToast();

    _currentTimer = 60;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentTimer--;
      if (_currentTimer <= 0) {
        _timer.cancel();
        _smsBtnName = "获取验证码";
        setState(() {});
      } else {
        _smsBtnName = _currentTimer.toString() + "s后获取验证码";
        setState(() {});
      }
    });
  }

  _oldPhone() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Text('新手机号'),
                SizedBox(width: 20),
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '请输入新手机号',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                      ),
                      controller: _phoneController,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  _sendSms() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '请输入验证码',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                      ),
                      controller: _smsController,
                    )),
                InkWell(
                  onTap: () {
                    if (_currentTimer <= 0) {
                      this._time();
                    }
                  },
                  child: Text(
                    _smsBtnName,
                    style: TextStyle(
                        color: isGoSendSms ? Colors.blueAccent : Colors.grey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _nextPage() {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        (isGo && isGoSendSms
                            ? Colors.blueAccent
                            : Colors.grey))),
                child: Padding(
                  child: Text("确认修改"),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  _closekeyboard();
                  if (isGo) {
                    Navigator.pushNamed(
                        context, Constants.editUserNewPhonePage);
                  }
                },
              ),
            ),
          ],
        ));
  }

  //关闭键盘
  _closekeyboard() {
    FocusScope.of(context).requestFocus(blankNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "绑定新手机号",
          //style: TextStyle(color: Colors.black54),
        ),
        //backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          _closekeyboard();
        },
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              this._oldPhone(),
              SizedBox(height: 6.0),
              this._sendSms(),
              this._nextPage()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
