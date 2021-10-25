import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/pending-booking.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/processing-booking.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/waiting-booking.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);
  final UserProfile? user;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Stack(children: [
          Container(
            height: 90,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  kPrimaryColor,
                  kPrimaryLightColor,
                  kBackgroundColor
                ], // red to yellow
                // repeats the gradient over the canvas
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
        ]),
        Container(
          height: 500,
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                Container(
                  height: 85,
                  child: AppBar(
                    backgroundColor: kBackgroundColor,
                    centerTitle: true,
                    title: Text("ĐƠN HÀNG TRONG NGÀY",
                        style: TextStyle(color: kTextColor)),
                    bottom: TabBar(
                      indicatorColor: kPrimaryColor,
                      labelColor: kTextColor,
                      tabs: [
                        Tab(
                          text: 'Đang xử lý',
                        ),
                        Tab(
                          text: 'Đang trì hoãn',
                        ),
                        Tab(
                          text: 'Đang chờ bạn',
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView(children: [ProcessingBooking()]),
                      ListView(children: [PendingBooking()]),
                      ListView(children: [WaitingBooking()]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
