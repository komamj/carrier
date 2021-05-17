import 'package:flutter/material.dart';

class DriverInfoBankCardInfoPage extends StatefulWidget {
  @override
  _DriverInfoBankCardInfoPageState createState() =>
      _DriverInfoBankCardInfoPageState();
}

class _DriverInfoBankCardInfoPageState
    extends State<DriverInfoBankCardInfoPage> {
  bool _giveVerse = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "银行卡",
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            _bankCardItem(),
            SizedBox(
              height: 15,
            ),
            Material(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(flex: 1, child: Text("默认收款")),
                    Switch(
                        value: _giveVerse,
                        onChanged: (bool newValue) {
                          setState(() {
                            _giveVerse = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(flex: 1, child: Text("默认支付")),
                    Switch(
                        value: _giveVerse,
                        onChanged: (bool newValue) {
                          setState(() {
                            _giveVerse = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  _unbindTips();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(flex: 1, child: Text("解除绑定")),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _unbindTips() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("解除银行卡绑定"),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "解除银行卡绑定后不能享受更多服务哦",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                '暂不解除',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('解除绑定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _bankCardItem() {
    return Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        child: ClipOval(
                          child: Image.network(
                            "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "中国邮政",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "谢梓州",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Text(
                                    "**** *** 8567",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
