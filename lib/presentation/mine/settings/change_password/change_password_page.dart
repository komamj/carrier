import 'package:carrier/presentation/util/validator.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isGo = true;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();

  String _oldPwdController = "";
  String _newPwdController = "";
  String _newConfirmPwdController = "";

  //关闭键盘
  _closekeyboard() {
    FocusScope.of(context).requestFocus(blankNode);
  }

  // 验证数据 登录
  void _forSubmitted() async {
    var _form = _formKey.currentState;
    if (_form!.validate()) {
      _form.save();
      print(_oldPwdController);
      print(_newPwdController);
      print(_newConfirmPwdController);
    }
  }

  _from() {
    return Container(
      child: Column(children: [
        SizedBox(width: 20),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        width: 60,
                        child: Text("旧密码"),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: '请输入旧密码',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none, color: Colors.white),
                          ),
                        ),
                        validator: (val) {
                          return val!.length <= 0 ? "请输入旧密码" : null;
                        },
                        onSaved: (val) {
                          _oldPwdController = val!;
                        },
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        width: 60,
                        child: Text("新密码"),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: '请输入新密码',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none, color: Colors.white),
                          ),
                        ),
                        validator: (val) {
                          if (val!.length <= 0) {
                            return "请输入新密码";
                          } else if (!validatePwd(val)) {
                            return "密码格式错误：密码长度为8-16位，数字、大小写字母、字符至少包含两种";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          _newPwdController = val!;
                        },
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        width: 60,
                        child: Text("确认密码"),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: '请输入确认密码',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none, color: Colors.white),
                          ),
                        ),
                        validator: (val) {
                          if (val!.length <= 0) {
                            return "请输入确认密码";
                          } else if (val != _newPwdController) {
                            return "确认密码输入错误";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          _newConfirmPwdController = val!;
                        },
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  _btn() {
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
                  child: Text("保 存"),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  _closekeyboard();
                  this._forSubmitted();
                  if (isGo) {
                    Navigator.pop(context, true);
                  }
                },
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "修改密码",
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _closekeyboard();
        },
        child: Flex(
          direction: Axis.vertical,
          children: [Expanded(flex: 1, child: _from()), _btn()],
        ),
      ),
    );
  }
}
