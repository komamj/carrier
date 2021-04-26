import 'package:carrier/presentation/waybill/waybill_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaybillPage extends StatefulWidget {
  @override
  _WaybillPageState createState() => _WaybillPageState();
}

class _WaybillPageState extends State<WaybillPage> {
  @override
  void initState() {
    super.initState();

    context.read<WaybillViewModel>().loadWaybill();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: context.select(
        (WaybillViewModel viewModel) => viewModel.firstLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
                itemCount: 50,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    "项目名称西南水泥项目名称西南水泥项目名称西南水泥项目名称西南水泥项目名称西南水泥项目名称西南水泥项目名称西南水泥",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                ),
                                Text(
                                  "托运已经拒绝",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "预约单号:201213213213123123",
                                  style: TextStyle(fontSize: 10),
                                ),
                                IconButton(
                                  iconSize: 12,
                                  icon: Icon(Icons.content_copy),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text("德阳市沈思市中国建材西南水泥"),
                                ),
                              ],
                            ),
                            Text(
                              "渣土，预约40吨",
                              style: TextStyle(fontSize: 10),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text("成周三合度运业有限公司"),
                                ),
                              ],
                            ),
                            Text(
                              "渣土，预约40吨",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "预计送达时间：2021-04-22 08:26:37",
                              style: TextStyle(fontSize: 10),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text("运输轨迹"),
                                )),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("修改回单"),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "未调度/计划量: 0顿/1000顿",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(true);
  }
}
