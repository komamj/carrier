import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class DriverInfoBankCardPage extends StatefulWidget {
  @override
  _DriverInfoBankCardPageState createState() => _DriverInfoBankCardPageState();
}

class _DriverInfoBankCardPageState extends State<DriverInfoBankCardPage> {
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Text(
                          "我的银行卡",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "共0张",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    )),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Constants.driverInfoBankAddCardPage);
                    })
              ],
            ),
            _bankCardItem(true),
            SizedBox(
              height: 10,
            ),
            _bankCardItem(false),
            SizedBox(
              height: 30,
            ),
            _addBankCard()
          ],
        ),
      ),
    );
  }

  _isDefBankCard(_isDefBK) {
    if (!_isDefBK) {
      return Align(
          alignment: Alignment.topRight,
          // FlutterLogo 是Flutter SDK提供的一个组件，内容就是Flutter的商标。
          child: Text(""));
    }

    return Align(
      alignment: Alignment.topRight,
      // FlutterLogo 是Flutter SDK提供的一个组件，内容就是Flutter的商标。
      child: Material(
        color: Colors.grey,
        borderRadius:
            // BorderRadius.horizontal(left: Radius.circular(10)),
            BorderRadius.only(bottomLeft: Radius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Text(
            "收款",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _bankCardItem(_isDefBK) {
    return Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Constants.driverInfoBankCardInfoPage);
          },
          child: Container(
            child: Stack(
              children: [
                _isDefBankCard(_isDefBK),
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

  _addBankCard() {
    return Material(
        color: Colors.black45,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Constants.driverInfoBankAddCardPage);
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 130),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Text(
                        "添加银行卡",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "支持储蓄卡",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
