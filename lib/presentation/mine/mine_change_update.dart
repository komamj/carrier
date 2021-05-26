import 'package:flutter/material.dart';

class MineChangeUpdate extends StatelessWidget {
  final String title;

  const MineChangeUpdate(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: InkWell(
          highlightColor: Color.fromRGBO(243, 243, 243, 0.6),
          onTap: () {},
          child: Container(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: Container(
                child: Text(title),
              )),
              Text(
                "v2.4.4",
                style: TextStyle(color: Colors.grey),
              )
            ]),
          )),
        ));
  }
}
