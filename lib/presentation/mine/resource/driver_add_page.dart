import 'package:carrier/presentation/util/constants.dart';
import 'package:carrier/presentation/util/validator.dart';
import 'package:flutter/material.dart';

class DriverAddPage extends StatefulWidget {
  @override
  _DriverAddPageState createState() => _DriverAddPageState();
}

class _DriverAddPageState extends State<DriverAddPage> {
  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();

  bool isGo = false;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      print(_idCardController.text);
      print(_nameController.text);
      if (_nameController.text.length > 0 && isIdCard(_idCardController.text)) {
        isGo = true;
      } else {
        isGo = false;
      }
      setState(() {});
    });

    _idCardController.addListener(() {
      print(_idCardController.text);
      print(_nameController.text);
      if (isIdCard(_idCardController.text) && _nameController.text.length > 0) {
        isGo = true;
      } else {
        isGo = false;
      }
      setState(() {});
    });
  }

  _nameInput() {
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
                Text("真实姓名"),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(
                        hintText: '请输入真实姓名',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                      ),
                      controller: _nameController,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  _idCardInput() {
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
                Text("身份证号"),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(
                        hintText: '请输入身份证号',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                      ),
                      controller: _idCardController,
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
                  child: Text("完成验证"),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  _closekeyboard();
                  if (isGo) {
                    Navigator.pushNamed(context, Constants.driverAddResultPage);
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
          "添加司机",
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          _closekeyboard();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameInput(),
              SizedBox(
                height: 2,
              ),
              _idCardInput(),
              SizedBox(
                height: 6,
              ),
              Text(
                "* 请确保姓名和身份证号一致",
                style: TextStyle(color: Colors.grey),
              ),
              _nextPage()
            ],
          ),
        ),
      ),
    );
  }
}
