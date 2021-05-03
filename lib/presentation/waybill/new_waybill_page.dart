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
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          buildPadding(),
          buildCarAndDriver(),
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
