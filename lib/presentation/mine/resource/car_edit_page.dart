import 'package:carrier/config/config.dart';
import 'package:flutter/material.dart';

class CarEditPage extends StatefulWidget {
  @override
  _CarEditPageState createState() => _CarEditPageState();
}

class _CarEditPageState extends State<CarEditPage> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('道路运输证'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Container(
                  child: Image.network(RTCURL),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "完善信息",
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Material(
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
                      child: Image.network(
                        "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f",
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
                              /*Text(
                                "川AMJ789",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),*/
                              Row(
                                children: [
                                  Text(
                                    "川B7878989",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
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
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Material(
                                    //53,209,47
                                    color: Color.fromRGBO(248, 248, 248, 0.5),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline,
                                            color:
                                                Color.fromRGBO(53, 209, 47, 1),
                                            size: 16,
                                          ),
                                          Text(
                                            "基础认证",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    53, 209, 47, 1)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Material(
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: Color.fromRGBO(
                                                152, 152, 152, 1),
                                            size: 16,
                                          ),
                                          Text(
                                            "完善信息",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
              child: Material(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "行驶证",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "* 请确保行驶证照片字体清晰、边框完整、亮度均匀",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 400,
                        height: 200,
                        child: Image.network(
                          "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 400,
                        height: 200,
                        child: Image.network(
                          "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("*车牌号码")),
                                Text("未填写",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("*发动机号")),
                                Text("未填写",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("*车架号")),
                                Text("未填写",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
              child: Material(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "道路运输证",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "* 请点击查看示例,",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () {
                              _showMyDialog();
                            },
                            child: Text(
                              "查看示例",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("*道路运输证号")),
                                Text("未填写",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("*道路运输经营许可证号")),
                                Text(
                                  "未填写",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
              child: Material(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "其他信息",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "车头照片",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "* 请上传完整车头照片，能清楚看到车牌号",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 400,
                        height: 200,
                        child: Image.network(
                          "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("车长(米)")),
                                Text("未填写",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("车型")),
                                Text(
                                  "未填写",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("载重(公斤)")),
                                Text(
                                  "未填写",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("车辆自重")),
                                Text(
                                  "未填写",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("轴数")),
                                Text(
                                  "未填写",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(flex: 1, child: Text("是否车头")),
                                Text(
                                  "未填写",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
