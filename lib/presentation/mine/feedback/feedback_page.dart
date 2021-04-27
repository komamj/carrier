import 'package:flutter/material.dart';
import 'package:license_plate_number/license_plate_number.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "意见反馈",
          //style: TextStyle(color: Colors.black54),
        ),
        //backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: PlateInputField(
          placeHolder: '沪A12345',
          styles: PlateStyles.light,
          inputFieldWidth: 40,
          inputFieldHeight: 54,
          onChanged: (List<String> array, String value) {
            // e.g.
            // array ['沪', 'A', '1', '2', '3', '4', '5', '6']
            // value 沪A123456
          },
        ),
      ),
    );
  }
}
