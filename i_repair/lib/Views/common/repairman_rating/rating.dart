import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';

enum RATING1 { r1, r2, r3 }

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  RATING1? _rating1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: 'Đánh giá chất lượng phục vụ',
        haveBackSpace: true,
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'I/ BÁO CÁO VỀ THIẾT BỊ:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Tôi đã sửa được thiết bị vận hành tốt.'),
              leading: Radio<RATING1>(
                value: RATING1.r1,
                groupValue: _rating1,
                onChanged: (value) => {
                  setState(() => {_rating1 = value!})
                },
              ),
            ),
            ListTile(
              title: const Text('Tôi cần thời gian để mua vật tư.'),
              leading: Radio<RATING1>(
                value: RATING1.r2,
                groupValue: _rating1,
                onChanged: (value) => {
                  setState(() => {_rating1 = value!})
                },
              ),
            ),
            ListTile(
              title: const Text('Tôi không thể sửa được thiết bị.'),
              leading: Radio<RATING1>(
                value: RATING1.r3,
                groupValue: _rating1,
                onChanged: (value) => {
                  setState(() => {_rating1 = value!})
                },
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'II/ BÁO CÁO THÊM:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Báo cáo thêm",
                  fillColor: Colors.white70,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment(1, 1), // 10% of the width, so there are ten blinds.
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
            child: Text('XÁC NHẬN'),
          ),
        ),
      ]),
    );
  }
}
