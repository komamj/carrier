import 'package:carrier/presentation/mine/resource/resource_management_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourceManagementMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*    context
        .read<ResourceManagementViewModel>()
        .updateCurrentIndex(this._index, false);*/

    return Container(
        height: 60,
        child: Material(
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Material(
              child: InkWell(
                child: Text(
                  "车辆管理",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.select(
                              (ResourceManagementViewModel viewModel) =>
                                  viewModel.currentIndex == 0)
                          ? Colors.black87
                          : Colors.grey),
                ),
                onTap: () => context
                    .read<ResourceManagementViewModel>()
                    .updateCurrentIndex(0, true),
              ),
            ),
            Material(
              child: InkWell(
                child: Text(
                  "司机管理",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.select(
                              (ResourceManagementViewModel viewModel) =>
                                  viewModel.currentIndex == 1)
                          ? Colors.black87
                          : Colors.grey),
                ),
                onTap: () => context
                    .read<ResourceManagementViewModel>()
                    .updateCurrentIndex(1, true),
              ),
            ),
          ]),
        ));
  }
}
