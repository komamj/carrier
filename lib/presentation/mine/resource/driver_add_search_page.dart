import 'package:flutter/material.dart';

class DriverAddSearchPage extends StatefulWidget {
  @override
  _DriverAddSearchPageState createState() => _DriverAddSearchPageState();
}

class _DriverAddSearchPageState extends State<DriverAddSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "搜索司机",
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("内容"),
      ),
    );
  }
}
