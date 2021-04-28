import 'package:flutter/material.dart';

class CarDelPage extends StatefulWidget {
  @override
  _CarDelPageState createState() => _CarDelPageState();
}

class _CarDelPageState extends State<CarDelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "编辑车辆",
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
