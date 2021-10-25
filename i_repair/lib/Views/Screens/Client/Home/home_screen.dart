import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/gridview-buttons.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/pending-booking.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/processing-booking.dart';
import 'package:i_repair/Views/common/card/icon-card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);
  final UserProfile? user;
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
                          Text(user!.fullName,
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
            height: 500,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: AppBar(
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: kBackgroundColor,
                      title: Text(
                        "YÊU CẦU CỦA BẠN",
                        style: TextStyle(color: kTextColor),
                      ),
                      bottom: TabBar(
                        labelColor: kTextColor,
                        tabs: [
                          Tab(
                            text: 'Đang xử lý',
                          ),
                          Tab(
                            text: 'Đang trì hoãn',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(children: [ProcessingBooking()]),
                        ListView(children: [PendingBooking()]),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
