import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  _listItemIcon(String title, String pageName) {
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

  _listItemText(String title) {
    return Material(
        color: Colors.white,
        child: InkWell(
          highlightColor: Color.fromRGBO(243, 243, 243, 0.6),
          onTap: () {
            //Navigator.pushNamed(context, pageName);
          },
          child: Container(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: Container(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.grey),
                ),
              ))
            ]),
          )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "设置",
          //style: TextStyle(color: Colors.black54),
        ),
        //backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            this._listItemIcon("修改密码", Constants.changePasswordPage),
            SizedBox(
              height: 1.0,
            ),
            this._listItemIcon("关于我们", Constants.aboutUsPage),
            SizedBox(
              height: 1.0,
            ),
            this._listItemText("退出"),
          ],
        ),
      ),
    );
  }
}
