import 'package:flutter/material.dart';

class DriverDelPage extends StatefulWidget {
  @override
  _DriverDelPageState createState() => _DriverDelPageState();
}

class _DriverDelPageState extends State<DriverDelPage> {
  late TextEditingController _searchController;
  late List listData;

  @override
  void initState() {
    super.initState();
    listData = [
      {"title": '梦游', 'phone': "7777777"},
      {"title": '梦瑶', 'phone': "7777777"},
      {"title": '李小双', 'phone': "7777777"},
    ];
    _searchController = TextEditingController();

    ///context.read<SchedulingViewModel>().loadToBeDetermined();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "编辑司机",
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
                          controller: _searchController,
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
                            hintText: "搜索司机",
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
                          child: _driverItem(listData[index]),
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
  _driverItem(item) {
    return Material(
        color: Colors.white,
        child: InkWell(
            onTap: () {},
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
                            Text(
                              item["title"],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              item["phone"],
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
            )));
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(true);
  }
}
