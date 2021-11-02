import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/pending-booking.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/processing-booking.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);
  final UserProfile? user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    final orderBloc = Provider.of<OrderDetailBloc>(context, listen: false);
    orderBloc.getProcessingBookingList(widget.user!.id);
    orderBloc.getPendingBookingList(widget.user!.id);
  }

  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
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
                      child: (widget.user!.avatar == "none")
                          ? Icon(CupertinoIcons.profile_circled, size: 50)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                widget.user!.avatar,
                                width: 70,
                                height: 70,
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Xin chào, một ngày tốt lành nhé !!! ',
                              style: TextStyle(fontSize: 16)),
                          Text(widget.user!.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          SizedBox(
                            height: 5,
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       width: 50,
                          //       child: Text("Cấp 10:",
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 12)),
                          //     ),
                          //     Container(
                          //         width: 120,
                          //         height: 10,
                          //         alignment: Alignment.topCenter,
                          //         child: LinearProgressIndicator(
                          //           backgroundColor: kBackgroundColor,
                          //           color: kSecondaryColor,
                          //           minHeight: 10,
                          //           value: 0.7,
                          //         )),
                          //     Container(
                          //       margin: EdgeInsets.only(left: 10),
                          //       child: Text("70/100 (ĐKN)",
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 12)),
                          //     ),
                          //   ],
                          // )
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
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Container(
                  height: 85,
                  child: AppBar(
                    backgroundColor: kBackgroundColor,
                    centerTitle: true,
                    title: Text("YÊU CẦU ĐANG CẦN BẠN",
                        style: TextStyle(color: kTextColor)),
                    bottom: TabBar(
                      indicatorColor: kPrimaryColor,
                      labelColor: kTextColor,
                      tabs: [
                        Tab(
                          text: 'Đang xử lý',
                        ),
                        Tab(
                          text:
                              'Đang trì hoãn (${orderBloc.pendingList.length})',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      RefreshIndicator(
                        child: (orderBloc.processingList.length == 0)
                            ? SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Container(
                                  padding: EdgeInsets.only(top: 170),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: kPrimaryLightColor,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: ClipRRect(
                                          child: Image.asset(
                                            "assets/images/repairman.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          child: Text(
                                              "HIỆN TẠI BẠN CHƯA YÊU CẦU ĐANG XỬ LÝ")),
                                    ],
                                  )),
                                ),
                              )
                            : ListView.builder(
                                itemCount: orderBloc.processingList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ProcessingBooking(
                                      orderDetail:
                                          orderBloc.processingList[index]);
                                },
                              ),
                        onRefresh: () => _fetchData(),
                      ),
                      (orderBloc.pendingList.length == 0)
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: kPrimaryLightColor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/repairman.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    child: Text(
                                        "THẬT TỐT LÀNH, KHÔNG CÓ YÊU CẦU TRÌ HOÃN NÀO CẢ.")),
                              ],
                            ))
                          : ListView.builder(
                              itemCount: orderBloc.pendingList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PendingBooking(
                                    orderDetail: orderBloc.pendingList[index]);
                              },
                            ),
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
