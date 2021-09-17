import 'package:flutter/material.dart';
import 'package:i_repair/common/common-appbar.dart';
import 'package:i_repair/common/search-bar.dart';

class FieldScreen extends StatefulWidget {
  final String major;
  FieldScreen(this.major);

  @override
  _FieldScreenState createState() => _FieldScreenState();
}

class _FieldScreenState extends State<FieldScreen> {
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: BaseAppBar(
            key: null,
            appBar: AppBar(),
            title: widget.major,
            haveBackSpace: true,
          ),
          body: Container(
            child: Row(
              children: [SearchBar(searchController: _searchController)],
            ),
          )),
    );
  }
}
