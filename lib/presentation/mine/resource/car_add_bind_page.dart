import 'package:flutter/material.dart';

class CarAddBindPage extends StatefulWidget {
  @override
  _CarAddBindPageState createState() => _CarAddBindPageState();
}

class _CarAddBindPageState extends State<CarAddBindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "关联车辆",
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
