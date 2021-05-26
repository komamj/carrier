import 'package:carrier/presentation/mine/feedback/feedback_title.dart';
import 'package:carrier/presentation/mine/feedback/feedback_view_model.dart';
import 'package:carrier/presentation/mine/feedback/feedback_status/save_page.dart';
import 'package:carrier/presentation/mine/feedback/feedback_status/replied_page.dart';
import 'package:carrier/presentation/mine/feedback/feedback_status/no_reply_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _pages = [SavePage(), RepliedPage(), NoReplyPage()];

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
        child: Column(
          children: [
            FeedbackTitle(context.watch<FeedbackViewModel>().currentIndex),
            _pages[context.watch<FeedbackViewModel>().currentIndex]
          ],
        ),
      ),
    );
  }
}
