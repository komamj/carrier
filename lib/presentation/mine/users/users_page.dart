import 'package:flutter/material.dart';

import '../../util/constants.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  _userPhoto() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Container(
              width: 80,
              child: ClipOval(
                child: Image.network(
                  'https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f',
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("冯更生"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  _userPhone() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("手机号"),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("1738888888"),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Constants.editUserPhonePage);
                    },
                    child: Text(
                      "更换",
                      style: TextStyle(color: Colors.blueAccent),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "个人信息",
          //style: TextStyle(color: Colors.black54),
        ),
        //backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            this._userPhoto(),
            SizedBox(
              height: 20,
            ),
            this._userPhone(),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Flex(direction: Axis.horizontal, children: [
                    Expanded(
                        child: Container(
                      child: Text("所属承运商"),
                    )),
                    Text(
                      "万古长青有限公司",
                      style: TextStyle(color: Colors.grey),
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
