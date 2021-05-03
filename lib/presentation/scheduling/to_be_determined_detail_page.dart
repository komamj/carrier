import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToBeDeterminedDetailPage extends StatefulWidget {
  @override
  _ToBeDeterminedDetailPageState createState() =>
      _ToBeDeterminedDetailPageState();
}

class _ToBeDeterminedDetailPageState extends State<ToBeDeterminedDetailPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("预约单详情"),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          buildPadding(),
          buildAppointmentFormInformation(),
          buildPadding(),
          buildRemark(),
          buildPadding(),
          buildCarriageInfo(),
          buildPadding(),
          buildUnloadInformation(),
          buildPadding(),
          buildReservationOrderEvent(),
          buildPadding(),
          buildAction(),
        ],
      ),
    );
  }

  /// 预约单信息
  Card buildAppointmentFormInformation() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildPadding(),
            Text(
              "预约单信息",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildPadding(),
            buildDivider(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "预约单号:201213213213123123",
                      ),
                      IconButton(
                        iconSize: 18,
                        icon: Icon(Icons.content_copy),
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: "201213213213123123"));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: const Text('复制成功!'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text("待确定"),
              ],
            ),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text("项目名称")),
                Text("成兰一标"),
              ],
            ),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text("项目负责人")),
                Text("成兰一标"),
              ],
            ),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text("下单时间")),
                Text("成兰一标"),
              ],
            ),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text("送达时间")),
                Text("成兰一标"),
              ],
            ),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  /// 备注
  Card buildRemark() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildPadding(),
            Text(
              "备注",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildPadding(),
            buildDivider(),
            buildPadding(),
            Text("无"),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  /// 承运信息
  Card buildCarriageInfo() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildPadding(),
            Text(
              "承运信息",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildPadding(),
            buildDivider(),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text("承运方"),
                ),
                Text("承运方名称"),
              ],
            ),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text("负责人"),
                ),
                Text("承运方负责人名称"),
              ],
            ),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text("联系电话"),
                ),
                Text("18664553197"),
              ],
            ),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  /// 提卸信息
  Card buildUnloadInformation() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildPadding(),
            Text(
              "提卸信息",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildPadding(),
            buildDivider(),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.import_contacts),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "德阳市沈思市中国建材西南水泥",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("四川省成都市武侯区双南街道长园路34号"),
                      Row(
                        children: [
                          Expanded(
                            child: Text("张帆"),
                          ),
                          Text("17344432456"),
                        ],
                      ),
                      Text("渣土，预约40吨"),
                    ],
                  ),
                ),
              ],
            ),
            buildPadding(),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.import_contacts),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "成周三合度运业有限公司",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("四川省成都市武侯区双南街道长园路34号"),
                      Row(
                        children: [
                          Expanded(
                            child: Text("张帆"),
                          ),
                          Text("17344432456"),
                        ],
                      ),
                      Text("渣土，预约40吨"),
                    ],
                  ),
                ),
              ],
            ),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  /// 预约单事件
  Card buildReservationOrderEvent() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildPadding(),
            Text(
              "预约单事件",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildPadding(),
            buildDivider(),
            buildPadding(),
            Text("无"),
            buildPadding(),
          ],
        ),
      ),
    );
  }

  Card buildAction() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: OutlinedButton(
              onPressed: () {},
              child: Text("拒绝"),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("调度"),
              ),
            ),
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
