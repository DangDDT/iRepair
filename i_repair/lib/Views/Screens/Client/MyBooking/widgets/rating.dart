import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Controllers/userController/userController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:provider/provider.dart';

enum RATING { r1, r2, r3, r4, r5 }

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = new TextEditingController();

  RATING? _rating;
  int? feedbackPoint;
  final orderId = Get.arguments;
  @override
  void initState() {
    _feedbackController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_feedbackController.text);
    final userBloc = Provider.of<UserBloc>(context);
    final orderBloc = Provider.of<OrderDetailBloc>(context);
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
                'I/ CHẤT LƯỢNG PHỤC VỤ CỦA THỢ:',
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
              leading: Radio<RATING>(
                value: RATING.r1,
                groupValue: _rating,
                onChanged: (value) => {
                  setState(() => {_rating = value!, feedbackPoint = 5})
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
              leading: Radio<RATING>(
                value: RATING.r2,
                groupValue: _rating,
                onChanged: (value) => {
                  setState(() => {_rating = value!, feedbackPoint = 4})
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
              leading: Radio<RATING>(
                value: RATING.r3,
                groupValue: _rating,
                onChanged: (value) => {
                  setState(() => {_rating = value!, feedbackPoint = 3})
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
              leading: Radio<RATING>(
                value: RATING.r4,
                groupValue: _rating,
                onChanged: (value) => {
                  setState(() => {_rating = value!, feedbackPoint = 2})
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
              leading: Radio<RATING>(
                value: RATING.r5,
                groupValue: _rating,
                onChanged: (value) => {
                  setState(() => {_rating = value!, feedbackPoint = 1})
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
                'II/ PHẢN HỒI CHI TIÊT:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Phản hồi chi tiết",
                    fillColor: Colors.white70,
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  controller: _feedbackController,
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
            onPressed: () async {
              await orderBloc.feedbackOrder(
                  orderId,
                  feedbackPoint,
                  (_feedbackController.text != '')
                      ? _feedbackController.text
                      : "Khách hàng không phản hồi");
              await orderBloc.getHistoryBookingList(userBloc.currentUser!.id);
              Get.back();
            },
            child: Text('XÁC NHẬN'),
          ),
        ),
      ]),
    );
  }
}
