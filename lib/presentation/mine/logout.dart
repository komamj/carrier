import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  final String title;
  const Logout(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: InkWell(
          highlightColor: Color.fromRGBO(243, 243, 243, 0.6),
          onTap: () {
            //Navigator.pushNamed(context, Constants.loginPage);
            Navigator.of(context).pushNamedAndRemoveUntil(
                Constants.loginPage, ModalRoute.withName(Constants.loginPage));
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
}
