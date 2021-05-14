import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDelPage extends StatefulWidget {
  @override
  _CarDelPageState createState() => _CarDelPageState();
}

class _CarDelPageState extends State<CarDelPage> {
  late TextEditingController _searchCarController;
  late List listData;

  @override
  void initState() {
    super.initState();
    listData = [
      {"title": '川AMJ729', "check": false},
      {"title": '川AMJ719', "check": false},
      {"title": '川AMJ709', "check": false},
      {"title": '川AMJ729', "check": false},
      {"title": '川AMJ719', "check": false},
      {"title": '川AMJ709', "check": false},
      {"title": '川AMJ729', "check": false},
      {"title": '川AMJ719', "check": false},
      {"title": '川AMJ709', "check": false},
      {"title": '川AMJ729', "check": false},
      {"title": '川AMJ719', "check": false},
      {"title": '川AMJ709', "check": false},
      {"title": '川AMJ729', "check": false},
      {"title": '川AMJ719', "check": false},
      {"title": '川AMJ709', "check": false},
      {"title": '川AMJ729', "check": false},
      {"title": '川AMJ7193', "check": false},
      {"title": '川AMJ7092', "check": false},
    ];
    _searchCarController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "编辑车辆",
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: 56,
              child: Material(
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child: TextField(
                          controller: _searchCarController,
                          maxLines: 1,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.all(0),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.6),
                            focusColor: Colors.white.withOpacity(0.5),
                            hoverColor: Colors.white.withOpacity(0.3),
                            hintText: "搜索车牌号",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.none, color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: (BorderSide(
                                  style: BorderStyle.none,
                                  color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
                flex: 1,
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView.builder(
                      itemCount: listData.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                          child: _carItem(listData[index]),
                        );
                      }),
                )),
            Container(
              height: 60,
              padding: EdgeInsets.fromLTRB(16, 0, 0, 10),
              child: Material(
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          child: Checkbox(
                            value: _value,
                            onChanged: (bool? value) {
                              if (value == null) {
                                setState(() {
                                  _value = false;
                                });
                              } else {
                                setState(() {
                                  _value = value;
                                });
                              }
                            },
                          ),
                        ),
                        Text("全选")
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              child: Container(
                                width: 70,
                                child: Text(
                                  "取消",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              child: Container(
                                width: 70,
                                child: Text(
                                  "移除",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.redAccent)),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _value = true;
  _carItem(item) {
    return Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, routeName);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 15, 16, 15),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  child: Checkbox(
                    value: true,
                    onChanged: (bool? value) {
                      if (value == null) {
                        setState(() {
                          item["check"] = false;
                        });
                      } else {
                        setState(() {
                          item["check"] = value;
                        });
                      }
                    },
                  ),
                ),
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
                          Text(
                            item["title"],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
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
                                        color: Color.fromRGBO(53, 209, 47, 1),
                                        size: 16,
                                      ),
                                      Text(
                                        "基础认证",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(53, 209, 47, 1)),
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
                                        color: Color.fromRGBO(152, 152, 152, 1),
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
        ));
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(true);
  }
}
