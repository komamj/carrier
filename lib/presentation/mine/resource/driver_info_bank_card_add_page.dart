import 'package:carrier/config/config.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverInfoBankCardAddPage extends StatefulWidget {
  @override
  _DriverInfoBankCardAddPageState createState() =>
      _DriverInfoBankCardAddPageState();
}

class _DriverInfoBankCardAddPageState extends State<DriverInfoBankCardAddPage> {
  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  bool isGo = false;
  //关闭键盘
  _closekeyboard() {
    FocusScope.of(context).requestFocus(blankNode);
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
                  child: Text("绑定银行卡"),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  _closekeyboard();
                  if (isGo) {}
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
            "添加银行卡",
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            // 点击空白页面关闭键盘
            _closekeyboard();
          },
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Text('持卡人'),
                                SizedBox(width: 20),
                                Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      maxLines: 1,
                                      autofocus: false,
                                      textAlign: TextAlign.end,
                                      decoration: const InputDecoration(
                                        hintText: '请输入持卡人',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.none,
                                              color: Colors.white),
                                        ),
                                      ),
                                      controller: _nameController,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Material(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Text('身份证号'),
                                SizedBox(width: 20),
                                Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      maxLines: 1,
                                      autofocus: false,
                                      textAlign: TextAlign.end,
                                      decoration: const InputDecoration(
                                        hintText: '请输入身份证号',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.none,
                                              color: Colors.white),
                                        ),
                                      ),
                                      controller: _idCardController,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Text('银行卡'),
                                SizedBox(width: 20),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          maxLines: 1,
                                          autofocus: false,
                                          textAlign: TextAlign.end,
                                          decoration: const InputDecoration(
                                            hintText: '请输入银行卡',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.none,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          controller: _idCardController,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                            Text("中国工商银行",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey,
                                                ))
                                          ],
                                        )
                                      ],
                                    )),
                                IconButton(
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {})
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    Constants.driverInfoBankCardAgreementPage);
                              },
                              child: Text(
                                "查看服务协议",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        _nextPage()
                      ],
                    ),
                  )),
              Container(
                child: InkWell(
                  onTap: () {
                    _contactCustomerServiceTips();
                  },
                  child: Text(
                    "联系客服",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _contactCustomerServiceTips() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("是否拨打客服电话"),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$CUSTOMERSERVICETEL",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
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
              child: Text('联系客服'),
              onPressed: () {
                launch("tel:$CUSTOMERSERVICETEL");
              },
            ),
          ],
        );
      },
    );
  }
}
