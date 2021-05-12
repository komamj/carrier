import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:license_plate_number/license_plate_number.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 0),
            child: ListView(
              children: [
                Text("* 车牌号码"),
                SizedBox(
                  height: 10,
                ),
                PlateInputField(
                  placeHolder: '沪A12345', // 初始值
                  styles: PlateStyles(
                    plateInputBorder: Border.fromBorderSide(BorderSide(
                      color: Colors.grey,
                      width: 1,
                      style: BorderStyle.solid,
                    )),
                  ),
                  inputFieldWidth: 36, // 单个输入框宽度
                  inputFieldHeight: 44, // 单个输入框高度
                  onChanged: (List<String> array, String value) {
                    // 监听输入内容
                    // array ['沪', 'A', '1', '2', '3', '4', '5']
                    // value 沪A12345
                    print(value);
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Text(
                      "注册",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey)),
                  onPressed: () {
                    Navigator.pushNamed(context, Constants.carAddBindPage);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
