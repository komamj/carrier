import 'package:carrier/presentation/mine/resource/resource_management_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarManagementPage extends StatefulWidget {
  const CarManagementPage({Key? key}) : super(key: key);

  @override
  _CarManagementPageState createState() => _CarManagementPageState();
}

class _CarManagementPageState extends State<CarManagementPage> {
  late TextEditingController _searchController;
  late List listData;

  @override
  void initState() {
    super.initState();
    listData = [
      {"title": '川AMJ729'},
      {"title": '川AMJ719'},
      {"title": '川AMJ709'},
    ];
    _searchController = TextEditingController();

    ///context.read<SchedulingViewModel>().loadToBeDetermined();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          height: 56,
          child: Material(
            color: Colors.white,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: TextField(
                      controller: _searchController,
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.all(0),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.6),
                        focusColor: Colors.white.withOpacity(0.5),
                        hoverColor: Colors.white.withOpacity(0.3),
                        hintText: "搜索车牌号",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.none, color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderSide: (BorderSide(
                              style: BorderStyle.none, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
        Expanded(
            flex: 1,
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                  itemCount: listData.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: _carItem(listData[index]),
                    );
                  }),
            ))
      ],
    );
  }

  _carItem(item) {
    return Material(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                    child: Text(
                      item["title"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  )),
              Container(
                width: 40,
                child: Text(
                  "空闲",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ));
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(true);
  }
}
