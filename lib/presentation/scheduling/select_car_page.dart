import 'package:flutter/material.dart';

class SelectCarPage extends StatefulWidget {
  @override
  _SelectCarPageState createState() => _SelectCarPageState();
}

class _SelectCarPageState extends State<SelectCarPage> {
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
        title: Text("选择车辆"),
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
                hintText: "车牌号",
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
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildPadding(),
              Text(
                "川B23225",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildPadding(),
              Row(
                children: [
                  Text("东风"),
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                  ),
                  Expanded(child: Text("载重30顿")),
                  Text("空闲"),
                ],
              ),
              buildPadding(),
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
