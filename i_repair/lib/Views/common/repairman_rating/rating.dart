import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';

enum RATING1 { r1, r2 }
enum RATING2 { r1, r2, r3, r4, r5 }

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  RATING1? _rating1;
  RATING2? _rating2;
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
                'I/ CHẤT LƯỢNG THIẾT BỊ SAU KHI SỬA:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Thiết bị đã vận hành tốt.'),
              leading: Radio<RATING1>(
                value: RATING1.r1,
                groupValue: _rating1,
                onChanged: (value) => {
                  setState(() => {_rating1 = value!})
                },
              ),
            ),
            ListTile(
              title: const Text('Thiết bị chưa được sửa theo mong muốn.'),
              leading: Radio<RATING1>(
                value: RATING1.r2,
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
                'II/ CHẤT LƯỢNG PHỤC VỤ CỦA THỢ:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(width: 120, child: const Text('Rất hài lòng')),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              leading: Radio<RATING2>(
                value: RATING2.r1,
                groupValue: _rating2,
                onChanged: (value) => {
                  setState(() => {_rating2 = value!})
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(width: 120, child: const Text('Hài lòng')),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              leading: Radio<RATING2>(
                value: RATING2.r2,
                groupValue: _rating2,
                onChanged: (value) => {
                  setState(() => {_rating2 = value!})
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(width: 120, child: const Text('Tạm ổn')),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              leading: Radio<RATING2>(
                value: RATING2.r3,
                groupValue: _rating2,
                onChanged: (value) => {
                  setState(() => {_rating2 = value!})
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(width: 120, child: const Text('Chưa hài lòng')),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              leading: Radio<RATING2>(
                value: RATING2.r4,
                groupValue: _rating2,
                onChanged: (value) => {
                  setState(() => {_rating2 = value!})
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(width: 120, child: const Text('Không hài lòng')),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              leading: Radio<RATING2>(
                value: RATING2.r5,
                groupValue: _rating2,
                onChanged: (value) => {
                  setState(() => {_rating2 = value!})
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
                'III/ PHẢN HỒI CHI TIÊT:',
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
                  hintText: "Phản hồi chi tiết",
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
                kSecondaryLightColor,
                kSecondaryColor,
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
