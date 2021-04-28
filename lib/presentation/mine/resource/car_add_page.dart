import 'package:flutter/material.dart';

class CarAddPage extends StatefulWidget {
  @override
  _CarAddPageState createState() => _CarAddPageState();
}

class _CarAddPageState extends State<CarAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "注册车辆",
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
