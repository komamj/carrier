import 'package:flutter/material.dart';

class NewWaybillPage extends StatefulWidget {
  @override
  _NewWaybillPageState createState() => _NewWaybillPageState();
}

class _NewWaybillPageState extends State<NewWaybillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新建运单"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          buildPadding(),
          buildCarAndDriver(),
          buildPadding(),
          buildPickupInformation(),
          buildPadding(),
          buildUnloadingInformation(),
          buildPadding(),
          buildAction(),
        ],
      ),
    );
  }

  /// 车辆司机选择
  Card buildCarAndDriver() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            buildPadding(),
            Row(
              children: [
                Expanded(
                  child: Text("车辆"),
                ),
                Text("选择车辆"),
                Icon(Icons.navigate_next),
              ],
            ),
            buildPadding(),
            Row(
              children: [
                Expanded(
                  child: Text("司机"),
                ),
                Text("选择司机"),
                Icon(Icons.navigate_next),
              ],
            ),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  /// 提货信息
  Card buildPickupInformation() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "提货信息",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  child: Text(
                    "添加提货点",
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            buildPadding(),
            Row(
              children: [
                Expanded(
                  child: Text("司机"),
                ),
                Text("选择司机"),
                Icon(Icons.navigate_next),
              ],
            ),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  /// 卸货信息
  Card buildUnloadingInformation() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildPadding(),
            Text(
              "卸货信息",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildPadding(),
            Row(
              children: [
                Expanded(
                  child: Text("卸货点"),
                ),
                Text("请选择卸货点"),
              ],
            ),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  Padding buildAction() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text("保存"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.only(top: 8),
    );
  }

  Divider buildDivider() {
    return Divider(
      height: 1,
    );
  }
}
