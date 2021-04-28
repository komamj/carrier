import 'package:flutter/material.dart';

class DriverAddPage extends StatefulWidget {
  @override
  _DriverAddPageState createState() => _DriverAddPageState();
}

class _DriverAddPageState extends State<DriverAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "添加司机",
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
