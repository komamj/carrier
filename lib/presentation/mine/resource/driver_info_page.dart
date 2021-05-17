import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverInfoPage extends StatefulWidget {
  @override
  _DriverInfoPageState createState() => _DriverInfoPageState();
}

class _DriverInfoPageState extends State<DriverInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "司机信息",
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  _driverItem(),
                  SizedBox(
                    height: 10,
                  ),
                  _realNameAuthentication(),
                  SizedBox(
                    height: 10,
                  ),
                  _userCHFP(),
                  SizedBox(
                    height: 10,
                  ),
                  _bankCard()
                ],
              ),
            ),
            Material(
              color: Colors.white,
              child: Container(
                height: 55,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            "移除",
                            textAlign: TextAlign.center,
                          ))
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

  /*司机信息*/
  _driverItem() {
    return Material(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipOval(
                  child: Image.network(
                    "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f",
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "梦游",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.lock_outline,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                onPressed: () => {})
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "18380479289",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(233, 233, 233, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: Text(
                                "实名",
                                style: TextStyle(fontSize: 10),
                              )
                              /* Icon(
                            Icons.account_box_outlined,
                            color: Colors.grey,
                          )*/
                              ,
                            ),
                            Container(
                              width: 20,
                              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: Icon(
                                Icons.admin_panel_settings_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              width: 20,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Icon(
                                Icons.calendar_view_day_rounded,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Container(
                width: 40,
                child: Text(
                  "空闲",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ));
  }

  /*实名认证*/
  _realNameAuthentication() {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(flex: 1, child: Text("实名认证")),
                Icon(
                  Icons.check_circle_outline,
                  size: 16,
                  color: Colors.grey,
                ),
                Text("已实名")
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Material(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "姓名：",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            "梦游",
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "证件号：",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            "513***********2378",
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
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

  /*用户资格认证*/
  _userCHFP() {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(flex: 1, child: Text("资格认证")),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Constants.driverEditPage);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Colors.grey,
                      ),
                      Text("未认证")
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Material(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "驾驶证认证：",
                                style: TextStyle(color: Colors.grey.shade600),
                              )),
                          Text(
                            "未认证",
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "货物运输从业资格证：",
                                style: TextStyle(color: Colors.grey.shade600),
                              )),
                          Text(
                            "未认证",
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "资格证：",
                                style: TextStyle(color: Colors.grey.shade600),
                              )),
                          Text(
                            "未认证",
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
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

  /*银行卡*/
  _bankCard() {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Constants.driverInfoBankCardPage);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(flex: 1, child: Text("银行卡")),
              Icon(
                Icons.check_circle_outline,
                size: 16,
                color: Colors.grey,
              ),
              Text("未绑定")
            ],
          ),
        ),
      ),
    );
  }
}
