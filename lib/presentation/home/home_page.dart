import 'package:carrier/presentation/home/home_view_model.dart';
import 'package:carrier/presentation/mine/mine_page.dart';
import 'package:carrier/presentation/mine/mine_title.dart';
import 'package:carrier/presentation/scheduling/scheduling_page.dart';
import 'package:carrier/presentation/scheduling/scheduling_title_page.dart';
import 'package:carrier/presentation/waybill/waybill_page.dart';
import 'package:carrier/presentation/waybill/waybill_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "调度"),
    BottomNavigationBarItem(
        icon: Icon(Icons.emoji_transportation), label: "运单"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
  ];

  final _titles = [SchedulingTitle(), WaybillTitle(), MineTitle()];

  final _pages = [SchedulingPage(), WaybillPage(), MinePage()];

  //待完成泛型 类别验证
  _appbar(int currentIndex) {
    if (currentIndex != 2) {
      return AppBar(
        title: _titles[currentIndex],
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context.watch<HomeViewModel>().currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavigationBarItems,
        currentIndex: context.watch<HomeViewModel>().currentIndex,
        onTap: (index) =>
            context.read<HomeViewModel>().updateCurrentIndex(index),
      ),
      body: _pages[context.watch<HomeViewModel>().currentIndex],
    );
  }
}
