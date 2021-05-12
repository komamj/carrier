import 'package:carrier/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class CarAddBindPage extends StatefulWidget {
  @override
  _CarAddBindPageState createState() => _CarAddBindPageState();
}

class _CarAddBindPageState extends State<CarAddBindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "关联车辆",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Material(
          color: Colors.white,
          child: ListView(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: Image.network(
                          "https://pics7.baidu.com/feed/a8773912b31bb051fb37de05c78e64b24bede083.jpeg?token=f02d22e51399a01c6c239e6247cec44f",
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "川B7878989",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Material(
                                      //53,209,47
                                      color: Color.fromRGBO(253, 243, 244, 1),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "已禁用",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "东风天锦",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(152, 152, 152, 1)),
                                )
                              ],
                            ),
                          )),
                      Container(
                        width: 80,
                        child: ElevatedButton(
                          child: Container(
                            child: Text(
                              "关联",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent)),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Constants.carAddBindResultPage);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
