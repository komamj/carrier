import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarAddBindResultPage extends StatefulWidget {
  @override
  _CarAddBindResultPageState createState() => _CarAddBindResultPageState();
}

class _CarAddBindResultPageState extends State<CarAddBindResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "车辆关联结果",
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
                "恭喜您已经完成车辆基础认证！",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Container(
                        width: 120,
                        child: Text(
                          "完善车辆信息",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueAccent)),
                      onPressed: () {
                        Navigator.pushNamed(context, Constants.carEditPage);
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      child: Container(
                        width: 120,
                        child: Text(
                          "继续添加",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      onPressed: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName(Constants.carAddPage));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
