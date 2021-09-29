import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        Container(width: 150, height: 135, child: GridViewButtons()),
        Container(
          margin: EdgeInsets.only(left: 20, top: 0),
          child: Text('ĐƠN HÀNG ĐANG SỬA CHỮA',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kPrimaryColor)),
        ),
        Container(
          height: 150,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 150,
                padding: EdgeInsets.all(5),
                width: size.width,
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
                          child: Text('ID:A122',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  color: kSecondaryLightColor))),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                              'Lắp 2 cái máy điều hòa tầng trệt và tầng 1, và sửa 1 điều hòa ở tầng 3.',
                              style:
                                  TextStyle(fontSize: 14, color: kTextColor))),
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
                                child: Icon(Icons.alarm)),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('14:30')),
                            VerticalDivider(
                              width: 50,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Text('Ngày 30/09/2021')),
                            VerticalDivider(
                              width: 50,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text('Thợ đang đến',
                                    style: TextStyle(color: kSecondaryColor))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.all(5),
                width: size.width,
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
                          child: Text('ID:A123',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  color: kSecondaryLightColor))),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                              'Sửa nồi cơm điện đang bị hư, cụ thể là nấu cơm không chín.',
                              style:
                                  TextStyle(fontSize: 14, color: kTextColor))),
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
                                child: Icon(Icons.alarm)),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('16:30')),
                            VerticalDivider(
                              width: 50,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Text('Ngày 30/09/2021')),
                            VerticalDivider(
                              width: 50,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Đang xử lý',
                                    style: TextStyle(color: kSecondaryColor))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
