import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';

enum FavoriteMethod { r1, r2, r3, r4 }

class CancelRequestPage extends StatefulWidget {
  @override
  _CancelRequestPageState createState() => _CancelRequestPageState();
}

class _CancelRequestPageState extends State<CancelRequestPage> {
  FavoriteMethod _method = FavoriteMethod.r1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: 'Chọn lý do bạn muốn hủy yêu cầu',
        haveBackSpace: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Tôi không thể sửa được thiết bị'),
            leading: Radio<FavoriteMethod>(
              value: FavoriteMethod.r1,
              groupValue: _method,
              onChanged: (value) => {
                setState(() => {_method = value!})
              },
            ),
          ),
          ListTile(
            title: const Text('Tôi không tìm được vị trí của khách hàng'),
            leading: Radio<FavoriteMethod>(
              value: FavoriteMethod.r2,
              groupValue: _method,
              onChanged: (value) => {
                setState(() => {_method = value!})
              },
            ),
          ),
          ListTile(
            title: const Text('Tôi không có đủ vật tư để sửa chữa'),
            leading: Radio<FavoriteMethod>(
              value: FavoriteMethod.r3,
              groupValue: _method,
              onChanged: (value) => {
                setState(() => {_method = value!})
              },
            ),
          ),
          ListTile(
            title: const Text('Lý do khác'),
            leading: Radio<FavoriteMethod>(
              value: FavoriteMethod.r4,
              groupValue: _method,
              onChanged: (value) => {
                setState(() => {_method = value!})
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  kPrimaryLightColor,
                  kPrimaryColor,
                ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: MaterialButton(
              onPressed: () {
                Get.offAndToNamed('/client_app');
              },
              child: Text('XÁC NHẬN HỦY'),
            ),
          ),
        ],
      ),
    );
  }
}
