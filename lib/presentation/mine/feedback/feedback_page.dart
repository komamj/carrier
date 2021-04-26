import 'package:flutter/material.dart';

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
    );
  }
}
