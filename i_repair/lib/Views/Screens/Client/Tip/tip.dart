import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<TipScreen> {
  bool isLoading = true;
  @override
  void initState() {
    countdown();
    super.initState();
  }

  countdown() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
    Get.offAllNamed('/client_app');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (isLoading)
                ? CircularProgressIndicator()
                : Icon(
                    CupertinoIcons.check_mark_circled,
                    color: CupertinoColors.activeGreen,
                    size: 60,
                  ),
            SizedBox(
              height: 20,
            ),
            (isLoading)
                ? Text('Đang xử lý, vui lòng đợi một vài giây...')
                : Column(
                    children: [
                      Text('THÀNH CÔNG',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Sau 3 giây sẽ chuyển về trang chủ.')
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
