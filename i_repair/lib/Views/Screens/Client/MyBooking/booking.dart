import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scaffoldKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    // disposing states
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          key: null,
          appBar: AppBar(),
          title: 'Lịch sử đơn hàng',
          haveBackSpace: true),
      body: Container(),
    );
  }
}
