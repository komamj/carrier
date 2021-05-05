import 'package:flutter/material.dart';

class SelectDriverPage extends StatefulWidget {
  @override
  _SelectDriverPageState createState() => _SelectDriverPageState();
}

class _SelectDriverPageState extends State<SelectDriverPage> {
  static const _idle = "空闲";
  static const _busy = "忙碌";

  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择司机"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildPadding(),
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
                hintText: "司机/手机号",
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
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return buildItems();
                  }),
            ),
          ),
          buildPadding(),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text("保存"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildPadding(),
        ],
      ),
    );
  }

  Padding buildItems() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                    'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildPadding(),
                    Text(
                      "张东邪",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    buildPadding(),
                    Row(
                      children: [
                        Expanded(
                          child: Text("17322234783"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                        ),
                        Text(_idle),
                      ],
                    ),
                    buildPadding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(true);
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.only(top: 8),
    );
  }
}
