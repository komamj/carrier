import 'package:carrier/presentation/mine/feedback/feedback_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackTitle extends StatelessWidget {
  final int currentIndex;

  const FeedbackTitle(this.currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  context.read<FeedbackViewModel>().updateCurrentIndex(0);
                },
                child: Container(
                  height: 50,
                  child: Center(
                      child: Text("提交问题",
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? Colors.black
                                  : Colors.black38))),
                ),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  context.read<FeedbackViewModel>().updateCurrentIndex(1);
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text("已回复",
                        style: TextStyle(
                            color: currentIndex == 1
                                ? Colors.black
                                : Colors.black38)),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  context.read<FeedbackViewModel>().updateCurrentIndex(2);
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text("未回复",
                        style: TextStyle(
                            color: currentIndex == 2
                                ? Colors.black
                                : Colors.black38)),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
