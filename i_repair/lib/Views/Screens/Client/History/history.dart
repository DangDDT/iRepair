import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Controllers/userController/userController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Views/Screens/Client/History/widgets/completed-booking.dart';
import 'package:provider/provider.dart';

import 'widgets/canceled-booking.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required this.user}) : super(key: key);
  final UserProfile? user;
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  _fetchData() async {
    final orderBloc = Provider.of<OrderDetailBloc>(context, listen: false);
    orderBloc.getCompletedBookingList(widget.user!.id);
    orderBloc.getCancelBookingList(widget.user!.id);
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
    Size size = MediaQuery.of(context).size;
    return (orderBloc.isLoading)
        ? Padding(
            padding: const EdgeInsets.all(150.0),
            child: Center(child: CircularProgressIndicator()),
          )
        : ListView(
            children: [
              Stack(children: [
                Container(
                  height: 140,
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
                      tileMode: TileMode
                          .repeated, // repeats the gradient over the canvas
                    ),
                  ),
                  child: Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child:
                                Icon(CupertinoIcons.profile_circled, size: 50),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lịch sử đơn hàng",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ]),
              Container(
                height: 600,
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        child: AppBar(
                          elevation: 0,
                          backgroundColor: kBackgroundColor,
                          bottom: TabBar(
                            indicatorColor: kPrimaryColor,
                            labelColor: kTextColor,
                            tabs: [
                              Tab(
                                  text:
                                      'Đã hoàn thành (${orderBloc.completedList.length})',
                                  icon: Icon(
                                    Icons.bookmark,
                                    color: CupertinoColors.activeGreen,
                                  )),
                              Tab(
                                  text:
                                      'Đã hủy (${orderBloc.cancelList.length})',
                                  icon: Icon(
                                    Icons.bookmark,
                                    color: CupertinoColors.systemRed,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            (orderBloc.completedList.length == 0)
                                ? Center(
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
                                              "BẠN CHƯA CÓ ĐƠN HÀNG HOÀN THÀNH")),
                                      Container(
                                          child: Text(
                                              "BẮT ĐẦU NHẬN ĐƠN THÔI NÀO. CỐ LÊN NHÉ !!!")),
                                    ],
                                  ))
                                : ListView.separated(
                                    itemCount: orderBloc.completedList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CompletedBooking(
                                          orderDetail:
                                              orderBloc.completedList[index]);
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider();
                                    },
                                  ),
                            (orderBloc.cancelList.length == 0)
                                ? Center(
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
                                              "BẠN CHƯA CÓ ĐƠN HÀNG HOÀN THÀNH")),
                                    ],
                                  ))
                                : ListView.separated(
                                    itemCount: orderBloc.cancelList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CanceledBooking(
                                          orderDetail:
                                              orderBloc.cancelList[index]);
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider();
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
  }
}
