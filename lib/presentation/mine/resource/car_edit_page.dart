import 'package:flutter/material.dart';

class CarEditPage extends StatefulWidget {
  @override
  _CarEditPageState createState() => _CarEditPageState();
}

class _CarEditPageState extends State<CarEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "完善信息",
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
