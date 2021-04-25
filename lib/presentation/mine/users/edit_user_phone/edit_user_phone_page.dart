import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../util/constants.dart';

class EditUserPhonePage extends StatefulWidget {
  @override
  _EditUserPhonePageState createState() => _EditUserPhonePageState();
}

class _EditUserPhonePageState extends State<EditUserPhonePage> {
  late Timer _timer;
  int _currentTimer = 60;

  String _smsBtnName = "获取验证码";

  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();
  final TextEditingController _smsController = TextEditingController();

  bool isGo = false;

  @override
  void initState() {
    super.initState();

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

  _time() {
    //Fluttertoast.showToast(msg: '短信验证码已发送，请注意查收', gravity: ToastGravity.CENTER);

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
                Expanded(child: Text('旧手机号')),
                Expanded(
                    child: Text(
                  '187777777',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey),
                ))
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
                        color: isGo ? Colors.blueAccent : Colors.grey),
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
                        (isGo ? Colors.blueAccent : Colors.grey))),
                child: Padding(
                  child: Text("下一步"),
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
          "更换手机号",
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
              this._sendSms(),
              this._nextPage()
            ],
          ),
        ),
      ),
    );
    ;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
