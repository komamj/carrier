import 'package:carrier/presentation/scheduling/scheduling_view_model.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToBeDeterminedPage extends StatefulWidget {
  const ToBeDeterminedPage({Key? key}) : super(key: key);

  @override
  _ToBeDeterminedPageState createState() => _ToBeDeterminedPageState();
}

class _ToBeDeterminedPageState extends State<ToBeDeterminedPage> {
  late TextEditingController _searchController;

  late TextEditingController _feedbackController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
    _feedbackController = TextEditingController();

    context.read<SchedulingViewModel>().loadToBeDetermined();
  }

  @override
  Widget build(BuildContext context) {
    return context
        .select((SchedulingViewModel viewModel) => viewModel.firstLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _body());
  }

  _body() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
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
              hintText: "搜索项目",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
                itemCount: 50,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildItem(context);
                }),
          ),
        ),
      ],
    );
  }

  Card buildItem(BuildContext context) {
    return Card(
      elevation: 4,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Constants.toBeDeterminedDetailPage);
          },
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
                        style: TextStyle(),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    Text(
                      "待确定",
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
                      onPressed: () {
                        showRejectDialog();
                      },
                      child: Text("拒绝"),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Constants.newWaybillPage);
                        },
                        child: Text("调度"),
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
      ),
    );
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(true);
  }

  Future<void> showRejectDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("拒绝"),
          content: TextField(
            maxLines: 5,
            maxLength: 120,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: "请输入拒绝原因",
              border: OutlineInputBorder(),
            ),
            controller: _feedbackController,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text("确认拒绝"),
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
  void dispose() {
    _searchController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }
}
