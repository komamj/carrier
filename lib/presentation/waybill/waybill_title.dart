import 'package:carrier/presentation/waybill/waybill_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaybillTitle extends StatefulWidget {
  @override
  _WaybillTitleState createState() => _WaybillTitleState();
}

class _WaybillTitleState extends State<WaybillTitle> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();

    context.read<WaybillViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
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
              hintText: "搜索项目",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "全部运单",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
