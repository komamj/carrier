import 'package:carrier/presentation/mine/logout.dart';
import 'package:carrier/presentation/mine/mine_list_item_icon.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            MineListItemIcon("修改密码", Constants.changePasswordPage),
            SizedBox(
              height: 2.0,
            ),
            MineListItemIcon("关于我们", Constants.aboutUsPage),
            SizedBox(
              height: 2.0,
            ),
            Logout("退出"),
          ],
        ),
      ),
    );
  }
}
