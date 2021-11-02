import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Views/Screens/Client/MyBooking/widgets/history-booking.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  final UserProfile? user;
  const BookingScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool _switchValue = false;
  @override
  void initState() {
    Provider.of<OrderDetailBloc>(context, listen: false)
        .getHistoryBookingList(widget.user!.id, false);
    super.initState();
  }

  @override
  void dispose() {
    // disposing states
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
    Size size = MediaQuery.of(context).size;
    return ListView(children: [
      Stack(children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment(1, 1), // 10% of the width, so there are ten blinds.
              colors: <Color>[
                kPrimaryColor,
                kPrimaryLightColor,
                kBackgroundColor
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: Container(
              padding: EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(CupertinoIcons.book, size: 50),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lịch sử đơn hàng",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                      ],
                    ),
                  ),
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
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  (_switchValue) ? "TẤT CẢ ĐƠN HÀNG" : "ĐƠN HÀNG HOÀN THÀNH",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (_switchValue) ? kTextColor : Colors.green),
                )),
          ),
          Container(
              child: Text(
            "HIỆN TẤT CẢ ĐƠN HÀNG",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          Container(
            width: 60,
            child: Switch(
              activeColor: kSecondaryColor,
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                  orderBloc.getHistoryBookingList(
                      widget.user!.id, _switchValue);
                });
              },
            ),
          ),
        ],
      ),
      Container(
        height: 500,
        child: (orderBloc.isLoading)
            ? Container(
                height: 500,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: CircularProgressIndicator()),
                  ],
                )),
              )
            : (orderBloc.historyList!.length == 0)
                ? Container(
                    height: 500,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child:
                                Text("HIỆN TẠI BẠN CHƯA YÊU CẦU ĐANG XỬ LÝ")),
                      ],
                    )),
                  )
                : ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return HistoryBooking(
                          orderDetail: orderBloc.historyList![index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: orderBloc.historyList!.length,
                  ),
      )
    ]);
  }
}
