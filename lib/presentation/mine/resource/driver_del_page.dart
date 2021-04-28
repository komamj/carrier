import 'package:flutter/material.dart';

class DriverDelPage extends StatefulWidget {
  @override
  _DriverDelPageState createState() => _DriverDelPageState();
}

class _DriverDelPageState extends State<DriverDelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "编辑司机",
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
