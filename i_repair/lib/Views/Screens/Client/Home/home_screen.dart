import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/gridview-buttons.dart';
import 'package:i_repair/Views/common/card/icon-card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);
  final CurrentUser? user;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Stack(children: [
          Container(
            height: 130,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  kPrimaryColor,
                  kPrimaryLightColor,
                  kBackgroundColor
                ], // red to yellow
                tileMode:
                    TileMode.clamp, // repeats the gradient over the canvas
              ),
            ),
            child: Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      child: Icon(CupertinoIcons.profile_circled, size: 50),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Xin chào, ', style: TextStyle(fontSize: 16)),
                          Text(user!.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            bottom: -10,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(250)),
                color: kBackgroundColor,
              ),
              width: size.width,
              height: 35,
              child: SizedBox(
                height: 10,
              ),
            ),
          )
        ]),
        Container(
            padding: EdgeInsets.only(top: 0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconCard(
                  number: 0,
                  icon: 'assets/images/money.png',
                  unit: 'VNĐ',
                  color: kPrimaryLightColor,
                ),
                IconCard(
                  number: 0,
                  icon: 'assets/images/hand-gesture.png',
                  unit: 'ĐIỂM',
                  color: kPrimaryLightColor,
                ),
              ],
            )),
        Container(width: 150, height: 150, child: GridViewButtons()),
        Container(
            width: 150,
            height: 35,
            margin: EdgeInsets.only(left: 15),
            child: Text('Đơn hàng vừa tiếp nhận',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))),
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
                                child: Icon(Icons.person)),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Trần Văn Thái')),
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
                              width: 20,
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
            ],
          ),
        )
      ],
    );
  }
}
