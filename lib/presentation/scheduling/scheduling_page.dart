import 'package:carrier/presentation/scheduling/in_the_scheduling_page.dart';
import 'package:carrier/presentation/scheduling/in_transit_page.dart';
import 'package:carrier/presentation/scheduling/scheduling_view_model.dart';
import 'package:carrier/presentation/scheduling/to_be_determined_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  late TextEditingController _searchController;

  final _pages = [ToBeDeterminedPage(), InTheSchedulingPage(), InTransitPage()];

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return _pages[context
        .select((SchedulingViewModel viewModel) => viewModel.currentIndex)];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
