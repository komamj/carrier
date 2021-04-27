import 'package:carrier/presentation/mine/resource/resource_management_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarManagementPage extends StatefulWidget {
  const CarManagementPage({Key? key}) : super(key: key);

  @override
  _CarManagementPageState createState() => _CarManagementPageState();
}

class _CarManagementPageState extends State<CarManagementPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return context.select(
        (ResourceManagementViewModel viewModel) => viewModel.firstLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _body());
  }

  _body() {
    return Container();
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return Future.value(true);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
