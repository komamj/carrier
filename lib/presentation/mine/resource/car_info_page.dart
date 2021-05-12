import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class CarInfoPage extends StatefulWidget {
  @override
  _CarInfoPageState createState() => _CarInfoPageState();
}

class _CarInfoPageState extends State<CarInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "车辆详情",
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            child: Text("完善信息"),
            onPressed: () {
              Navigator.pushNamed(context, Constants.carEditPage);
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("内容"),
      ),
    );
  }
}
