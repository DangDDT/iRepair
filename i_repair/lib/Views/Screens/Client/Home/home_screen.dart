import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/majorController/majorController.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/gridview-buttons.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/pending-booking.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/processing-booking.dart';
import 'package:i_repair/Views/common/card/icon-card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);
  final UserProfile? user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MajorController majorController = Get.put(MajorController());
  @override
  void initState() {
    super.initState();
    majorController.fetchMajors();
    Provider.of<OrderDetailBloc>(context, listen: false)
        .getProcessingBookingList(widget.user!.id);
    Provider.of<OrderDetailBloc>(context, listen: false)
        .getPendingBookingList(widget.user!.id);
  }

  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
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
                    (widget.user!.avatar == "none")
                        ? Container(
                            child:
                                Icon(CupertinoIcons.profile_circled, size: 50),
                          )
                        : Container(
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              widget.user!.avatar,
                              height: 70,
                              width: 70,
                            ),
                          )),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Xin chào, ', style: TextStyle(fontSize: 16)),
                          Text(widget.user!.fullName,
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
              height: 10,
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
        if (majorController.majorList.isEmpty)
          Container(
            height: 200,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: CircularProgressIndicator()),
              ],
            )),
          )
        else
          Container(
              width: 150,
              height: 230,
              child: GridViewButtons(majors: majorController.majorList)),
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
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                      ),
                      bottom: TabBar(
                        labelColor: kTextColor,
                        tabs: [
                          Tab(
                            text:
                                'Đang xử lý (${orderBloc.processingList!.length})',
                          ),
                          Tab(
                            text:
                                'Đang trì hoãn (${orderBloc.pendingList!.length})',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        if (orderBloc.processingList == null)
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: CircularProgressIndicator()),
                            ],
                          ))
                        else if (orderBloc.processingList!.length == 0)
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Text(
                                      "HIỆN TẠI BẠN CHƯA YÊU CẦU ĐANG XỬ LÝ")),
                            ],
                          ))
                        else
                          ListView.builder(
                            itemCount: orderBloc.processingList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProcessingBooking(
                                  orderDetail:
                                      orderBloc.processingList![index]);
                            },
                          ),
                        if (orderBloc.pendingList == null)
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: CircularProgressIndicator()),
                            ],
                          ))
                        else if (orderBloc.pendingList!.length == 0)
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Text(
                                      "KHÔNG CÓ YÊU CẦU TRÌ HOÃN NÀO CẢ.")),
                            ],
                          ))
                        else
                          ListView.builder(
                            itemCount: orderBloc.pendingList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(orderBloc.pendingList![index].toJson());
                              return PendingBooking(
                                  orderDetail: orderBloc.pendingList![index]);
                            },
                          ),
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
