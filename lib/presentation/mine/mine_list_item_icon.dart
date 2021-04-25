import 'package:flutter/material.dart';

class MineListItemIcon extends StatefulWidget {
  const MineListItemIcon({Key? key}) : super(key: key);
  @override
  MineListItemIconState createState() => MineListItemIconState();
}

class MineListItemIconState extends State<MineListItemIcon> {
  @override
  void initState() {
    super.initState();
  }

  listItemIcon(String title, String pageName) {
    return Material(
        color: Colors.white,
        child: InkWell(
          highlightColor: Color.fromRGBO(243, 243, 243, 0.6),
          onTap: () {
            Navigator.pushNamed(context, pageName);
          },
          child: Container(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: Container(
                child: Text(title),
              )),
              Icon(
                Icons.navigate_next,
                color: Colors.grey,
              )
            ]),
          )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
