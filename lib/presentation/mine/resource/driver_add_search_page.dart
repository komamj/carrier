import 'package:carrier/presentation/util/constants.dart';
import 'package:carrier/presentation/util/validator.dart';
import 'package:flutter/material.dart';

class DriverAddSearchPage extends StatefulWidget {
  @override
  _DriverAddSearchPageState createState() => _DriverAddSearchPageState();
}

class _DriverAddSearchPageState extends State<DriverAddSearchPage> {
  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();
  final TextEditingController _phoneController = TextEditingController();

  bool isGo = false;
  bool isFindDriver = false;

  @override
  void initState() {
    super.initState();

    _phoneController.addListener(() {
      print(_phoneController.text);
      if (isMobilePhoneNumber(_phoneController.text)) {
        isGo = true;
      } else {
        isGo = false;
      }
      setState(() {});
    });
  }

  _showToast() {}

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  isFindDriver ? "检测到该司机已存在" : "未检测到该司机信息",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                '取消',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(isFindDriver ? '加载司机信息' : '创建司机信息'),
              onPressed: () {
                if (isFindDriver) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.pushNamed(context, Constants.driverAddPage);
                }
              },
            ),
          ],
        );
      },
    );
  }

  //关闭键盘
  _closekeyboard() {
    FocusScope.of(context).requestFocus(blankNode);
  }

  _phoneInput() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '请输入司机手机号',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                      ),
                      controller: _phoneController,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  _nextPage() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        (isGo ? Colors.blueAccent : Colors.grey))),
                child: Padding(
                  child: Text("检测司机"),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  _closekeyboard();
                  if (isGo) {
                    _showMyDialog();
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
          "搜索检测司机",
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          _closekeyboard();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              this._phoneInput(),
              SizedBox(height: 6.0),
              this._nextPage()
            ],
          ),
        ),
      ),
    );
  }
}
