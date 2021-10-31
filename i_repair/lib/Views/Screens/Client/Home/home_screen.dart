import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/majorController/majorController.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Controllers/tipController/tipController.dart';
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
    Provider.of<TipBloc>(context, listen: false).getTipList();
  }

  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
    final tipBloc = Provider.of<TipBloc>(context);
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
          Card(
            child: Container(
              height: 200,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: CircularProgressIndicator()),
                ],
              )),
            ),
          )
        else
          Container(
            height: 230,
            child: GridViewButtons(majors: majorController.majorList),
          ),
        Container(
            height: 480,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  Container(
                    height: 75,
                    child: AppBar(
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: kBackgroundColor,
                      title: Text(
                        "YÊU CẦU CỦA BẠN",
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      bottom: TabBar(
                        labelColor: kTextColor,
                        labelStyle: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.bold),
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
        SizedBox(
          height: 10,
        ),
        if (tipBloc.tipList.length != 0)
          Container(
            width: 300,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("MỘT SỐ MẸO VẶT HỮU ÍCH",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                ),
                ImageSlideshow(
                  /// Width of the [ImageSlideshow].
                  width: double.infinity,

                  /// Height of the [ImageSlideshow].
                  height: 370,

                  /// The page to show when first creating the [ImageSlideshow].
                  initialPage: 0,

                  /// The color to paint the indicator.
                  indicatorColor: Colors.blue,

                  /// The color to paint behind th indicator.
                  indicatorBackgroundColor: Colors.grey,

                  /// The widgets to display in the [ImageSlideshow].
                  /// Add the sample image file into the images folder
                  children: List<Widget>.generate(
                      tipBloc.tipList.length,
                      (index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide.none),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(9,
                                      1), // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
                                    kBackgroundColor,
                                    kPrimaryColor
                                  ], // red to yellow
                                  tileMode: TileMode
                                      .repeated, // repeats the gradient over the canvas
                                ),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 120,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                              tipBloc.tipList[index].imageUrl!,
                                              fit: BoxFit.fitHeight),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                                width: 220,
                                                child: Text(
                                                  "${tipBloc.tipList[index].title!.toUpperCase()}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "${tipBloc.tipList[index].content!}",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      )),
                                ],
                              )))),

                  /// Called whenever the page in the center of the viewport changes.
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },

                  /// Auto scroll interval.
                  /// Do not auto scroll with null or 0.
                  autoPlayInterval: 10000,

                  /// Loops back to first slide.
                  isLoop: true,
                ),
              ],
            ),
          )
      ],
    );
  }
}
