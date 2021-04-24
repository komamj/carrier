import 'package:carrier/presentation/scheduling/scheduling_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchedulingTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            child: InkWell(
              child: Text(
                context.select((SchedulingViewModel viewModel) =>
                    "待确定(${viewModel.toBeDeterminedCount})"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.00,
                    color: context.select((SchedulingViewModel viewModel) =>
                            viewModel.currentIndex == 0)
                        ? Colors.black87
                        : Colors.grey),
              ),
              onTap: () =>
                  context.read<SchedulingViewModel>().updateCurrentIndex(0),
            ),
          ),
          Material(
            child: InkWell(
              child: Text(
                context.select((SchedulingViewModel viewModel) =>
                    "调度中(${viewModel.inTheSchedulingCount})"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.00,
                    color: context.select((SchedulingViewModel viewModel) =>
                            viewModel.currentIndex == 1)
                        ? Colors.black87
                        : Colors.grey),
              ),
              onTap: () =>
                  context.read<SchedulingViewModel>().updateCurrentIndex(1),
            ),
          ),
          Material(
            child: InkWell(
              child: Text(
                context.select((SchedulingViewModel viewModel) =>
                    "在途(${viewModel.inTransitCount})"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.00,
                    color: context.select((SchedulingViewModel viewModel) =>
                            viewModel.currentIndex == 2)
                        ? Colors.black87
                        : Colors.grey),
              ),
              onTap: () =>
                  context.read<SchedulingViewModel>().updateCurrentIndex(2),
            ),
          ),
        ],
      ),
    );
  }
}
