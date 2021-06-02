import 'package:carrier/config/config.dart';
import 'package:carrier/presentation/mine/mine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:carrier/presentation/util/constants.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String _avatar = AVATARDEF;
  String _name = "";
  String _mobile = "";
  String _companyName = "";

  @override
  void initState() {
    super.initState();
    context.read<MineViewModel>().getUser().then((user) {
      setState(() {
        _name = user.avatar!;
        _name = user.nickName!;
        _mobile = user.phoneNumber!;
        _companyName = user.organizationName!;
      });
    });
  }

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
                  _avatar,
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
                  Text(_name),
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
                  child: Text(_mobile),
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
                      _companyName,
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
