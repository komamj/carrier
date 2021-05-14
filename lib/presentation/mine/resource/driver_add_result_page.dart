import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverAddResultPage extends StatefulWidget {
  @override
  _DriverAddResultPageState createState() => _DriverAddResultPageState();
}

class _DriverAddResultPageState extends State<DriverAddResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "添加司机结果",
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Material(
          child: ListView(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 140,
                color: Colors.green[400],
              ),
              Text(
                "恭喜您已完成实名认证！",
                textAlign: TextAlign.center,
              ),
              TextButton(
                child: Text(
                  "完善身份信息",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Constants.driverEditPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
