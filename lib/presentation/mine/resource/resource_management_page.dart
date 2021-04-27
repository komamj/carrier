import 'package:carrier/presentation/mine/resource/car_management_page.dart';
import 'package:carrier/presentation/mine/resource/driver_management_page.dart';
import 'package:carrier/presentation/mine/resource/resource_management_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourceManagementPage extends StatefulWidget {
  ResourceManagementPage({Key? key}) : super(key: key);

  @override
  _ResourceManagementPageState createState() => _ResourceManagementPageState();
}

class _ResourceManagementPageState extends State<ResourceManagementPage> {
  final _pages = [CarManagementPage(), DriverManagementPage()];

  @override
  Widget build(BuildContext context) {
    //https://www.jianshu.com/p/d14956aa48cc

    /*context
        .read<ResourceManagementViewModel>()
        .updateCurrentIndex(0);*/
    var value = ModalRoute.of(context)!.settings.arguments as Map;
    print("pageType 初始获取到的值 ==>" + value["pageType"].toString());

    context
        .read<ResourceManagementViewModel>()
        .updateCurrentIndex(value["pageType"]);
    // print("111");
    // print(context.watch<ResourceManagementViewModel>().currentIndex);
    // print("111");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "资源管理",
        ),
        centerTitle: true,
      ),
      body: _pages[context.watch<ResourceManagementViewModel>().currentIndex],
    );
  }
}
