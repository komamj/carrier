import 'package:carrier/domain/model/user.dart';
import 'package:carrier/presentation/mine/mine_view_model.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final _cardVerticalSpacing = 20.0;

  @override
  void initState() {
    super.initState();
    context.read<MineViewModel>().getUser();
  }

  _userInfo() {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            InkWell(
              // When the user taps the button, show a snackbar.
              onTap: () {
                Navigator.pushNamed(context, Constants.usersPage);
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: ClipOval(
                          child: Image.network(
                            context.read<MineViewModel>().avatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                          child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context.read<MineViewModel>().name),
                            Text(
                              context.read<MineViewModel>().mobile,
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              context.read<MineViewModel>().companyName,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      )),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  _resourceManage() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("资源管理"),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      child: Column(
                        children: [
                          Image.network(
                            'https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f',
                            width: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("车辆管理"),
                        ],
                      ),
                      onTap: () {
                        // context.select((MineViewModel viewModel) =>
                        //     viewModel.updateCurrentIndex(1));

                        Navigator.pushNamed(context, Constants.resourcePage,
                            arguments: {"pageType": 0});
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      child: Column(
                        children: [
                          Image.network(
                            'https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f',
                            width: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("司机管理"),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Constants.resourcePage,
                            arguments: {"pageType": 1});
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

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

  _listMenu() {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          this._listItemIcon("平台协议", Constants.agreementPage),
          SizedBox(
            height: 2,
          ),
          this._listItemIcon("意见反馈", Constants.feedbackPage),
          SizedBox(
            height: 2,
          ),
          this._listItemIcon("设置", Constants.settingsPage),
          SizedBox(
            height: 2,
          ),
          this._listItemText("检查更新")
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _userInfo(),
        SizedBox(
          height: this._cardVerticalSpacing,
        ),
        _resourceManage(),
        SizedBox(
          height: this._cardVerticalSpacing,
        ),
        _listMenu()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
