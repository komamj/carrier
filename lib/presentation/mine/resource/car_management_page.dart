import 'package:flutter/material.dart';

class CarManagementPage extends StatefulWidget {
  const CarManagementPage({Key? key}) : super(key: key);

  @override
  _CarManagementPageState createState() => _CarManagementPageState();
}

class _CarManagementPageState extends State<CarManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("车辆管理"),
    );
  }
}
