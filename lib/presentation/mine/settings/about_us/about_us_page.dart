import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  _listItem(title, body) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          child: Flex(direction: Axis.horizontal, children: [
            Container(
              width: 70,
              child: Text(title, style: TextStyle(color: Colors.black54)),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
                flex: 1,
                child: Text(body, style: TextStyle(color: Colors.grey)))
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "关于我们",
          //style: TextStyle(color: Colors.black54),
        ),
        //backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                child: Image.network(
                  'https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f',
                  width: 150,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text("承运端"),
            ),
            SizedBox(
              height: 2,
            ),
            Center(
              child: Text("V2.3.3"),
            ),
            SizedBox(
              height: 20,
            ),
            _listItem("客服电话", "17760427036"),
            _listItem("微信公众号", "ejianda56"),
            _listItem("公司邮箱", "ejianda@dingshikj.com"),
            _listItem("公司地址", "成都市青羊区光华东三路489号西环广场4栋10楼1003-1005"),
            SizedBox(
              height: 20,
            ),
            _listItem("版本说明", "17760427036"),
          ],
        ),
      ),
    );
    ;
  }
}
