import 'package:carrier/presentation/mine/resource/car_management_page.dart';
import 'package:carrier/presentation/mine/resource/driver_management_page.dart';
import 'package:carrier/presentation/mine/resource/resource_management_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourceManagementPage extends StatefulWidget {
  const ResourceManagementPage({Key? key}) : super(key: key);

  @override
  _ResourceManagementPageState createState() => _ResourceManagementPageState();
}

class _ResourceManagementPageState extends State<ResourceManagementPage> {
  final _pages = [CarManagementPage(), DriverManagementPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "资源管理",
          ),
          centerTitle: true,
        ),
        body:
            _pages[context.watch<ResourceManagementViewModel>().currentIndex]);
  }
}
