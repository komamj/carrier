import 'package:flutter/material.dart';

class DriverEditPage extends StatefulWidget {
  @override
  _DriverEditPageState createState() => _DriverEditPageState();
}

class _DriverEditPageState extends State<DriverEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "完善信息",
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
