import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/gridview-buttons.dart';
import 'package:i_repair/Views/common/card/icon-card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Stack(children: [
          Container(
            height: 280,
            child: Stack(children: [
              Positioned(
                  top: 40,
                  left: -5,
                  child: Container(
                    height: 280,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/banner.jpg',
                      ),
                    ),
                  )),
            ]),
          ),
          Container(
            height: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  kPrimaryColor,
                  kPrimaryLightColor
                ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        CupertinoIcons.profile_circled,
                        size: 50,
                        color: kBackgroundColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Xin chào, ',
                              style: TextStyle(
                                  fontSize: 16, color: kBackgroundColor)),
                          Text('Đỗ Dương Tâm Đăng',
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: kBackgroundColor)),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
                padding: EdgeInsets.only(top: 0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconCard(
                      number: 120000,
                      icon: 'assets/images/money.png',
                      unit: 'VND',
                      color: kBackgroundColor,
                    ),
                    IconCard(
                      number: 200,
                      icon: 'assets/images/hand-gesture.png',
                      unit: 'RP',
                      color: kBackgroundColor,
                    ),
                  ],
                )),
          ),
        ]),
        Container(width: 150, height: 150, child: GridViewButtons()),
        Container(
          margin: EdgeInsets.only(left: 20, top: 0),
          child: Text('YÊU CẦU VỪA MỚI TẠO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kPrimaryColor)),
        ),
        Container(
          height: 170,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 150,
                padding: EdgeInsets.all(5),
                width: size.width,
                child: InkWell(
                  onTap: () => {},
                  child: Card(
                    elevation: 5,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20, top: 20),
                                    child: Text('MÃ YÊU CẦU: A121',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kSecondaryLightColor))),
                                Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Text('ĐỒ CẦN SỬA: ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: kTextColor,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Máy giặt',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: kTextColor)),
                                        ],
                                      ),
                                    )),
                                SizedBox(height: 5),
                                Container(
                                    margin: EdgeInsets.only(left: 20, top: 0),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Text('VẤN ĐỀ GẶP PHẢI: ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: kTextColor,
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            child: Text(
                                                'Cửa bị chênh hoặc không kín',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: kTextColor)),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 30, top: 20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                    onTap: () => {Get.offAndToNamed("/rating")},
                                    child: Text(
                                      "XÁC NHẬN",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kBackgroundColor),
                                    )))
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(
                          height: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Icon(Icons.person)),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Phạm Hữu Nghĩa')),
                              VerticalDivider(
                                width: 20,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Text('Ngày 30/09/2021')),
                              VerticalDivider(
                                width: 30,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text('Đã hoàn thành',
                                      style:
                                          TextStyle(color: kSecondaryColor))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.all(5),
                width: size.width,
                child: InkWell(
                  onTap: () => {Get.toNamed("/map")},
                  child: Card(
                    elevation: 5,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text('MÃ YÊU CẦU: A122',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    color: kSecondaryLightColor))),
                        Container(
                            margin: EdgeInsets.only(left: 20, top: 5),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text('ĐỒ CẦN SỬA: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kTextColor,
                                          fontWeight: FontWeight.bold)),
                                  Text('Tủ lạnh',
                                      style: TextStyle(
                                          fontSize: 14, color: kTextColor)),
                                ],
                              ),
                            )),
                        SizedBox(height: 5),
                        Container(
                            margin: EdgeInsets.only(left: 20, top: 0),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text('VẤN ĐỀ GẶP PHẢI: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kTextColor,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    child: Text('Cửa bị chênh hoặc không kín',
                                        style: TextStyle(
                                            fontSize: 14, color: kTextColor)),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 5),
                        Divider(
                          height: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Icon(Icons.person)),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text('Phạm Hữu Nghĩa')),
                              VerticalDivider(
                                width: 20,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Text('Ngày 30/09/2021')),
                              VerticalDivider(
                                width: 30,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text('Thợ đang đến',
                                      style:
                                          TextStyle(color: kSecondaryColor))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
