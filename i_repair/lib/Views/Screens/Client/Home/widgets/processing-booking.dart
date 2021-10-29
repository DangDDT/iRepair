import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/reason-page.dart';
import 'package:intl/intl.dart';
import 'dart:math' show asin, cos, pow, sqrt;

import 'package:provider/provider.dart';

class ProcessingBooking extends StatefulWidget {
  final OrderDetail orderDetail;
  const ProcessingBooking({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  _ProcessingBookingState createState() => _ProcessingBookingState();
}

class _ProcessingBookingState extends State<ProcessingBooking> {
  double distance = 0;
  Timer? _timer;
  double calculateDistance(lat1, lon1, lat2, lon2) {
    num mod = pow(10.0, 1);
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return ((12742 * asin(sqrt(a)) * mod).round().toDouble() / mod);
  }

  @override
  void initState() {
    super.initState();
    const fiveSec = const Duration(seconds: 5);
    _fetchDistance();
    _timer = new Timer.periodic(fiveSec, (Timer t) {
      _fetchDistance();
    });
  }

  _fetchDistance() async {
    final orderBloc = Provider.of<OrderDetailBloc>(context, listen: false);
    orderBloc.getLocation();
    if (this.mounted && orderBloc.locationData != null) {
      setState(() => {
            distance = calculateDistance(
                widget.orderDetail.order.lat,
                widget.orderDetail.order.lng,
                orderBloc.locationData!.latitude,
                orderBloc.locationData!.longitude),
          });
    }
  }

  
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);

    return (orderBloc.isLoading)
        ? Padding(
            padding: const EdgeInsets.all(150.0),
            child: Center(child: CircularProgressIndicator()),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide.none),
              child: Container(
                height: 380.0,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text("NGÀY TẠO: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(
                                    "${widget.orderDetail.order.createTime}"),
                              )
                            ],
                          ),
                          Divider(
                            height: 10,
                            thickness: 1,
                            indent: 0,
                            endIndent: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("ĐỒ CẦN SỬA: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text("${widget.orderDetail.field.name}"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("DỊCH VỤ: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(
                                    "${widget.orderDetail.service.serviceName}"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("PHÍ DỊCH VỤ: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(
                                    "${NumberFormat.currency(locale: 'vi').format(widget.orderDetail.order.total)}"),
                              )
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("TÊN KHÁCH HÀNG: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(
                                    "${widget.orderDetail.customer.fullName}"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("SỐ ĐIỆN THOẠI: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(
                                    "${widget.orderDetail.customer.phoneNumber}"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("ĐỊA CHỈ: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                width: 300,
                                child: Text(
                                    "${widget.orderDetail.order.customerAddress}"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("KHOẢNG CÁCH: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text("${distance} km"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      indent: 30,
                      endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          color: CupertinoColors.systemGrey,
                          onPressed: () {},
                          child: Text(
                            "BẢN ĐỒ",
                            style: TextStyle(color: kBackgroundColor),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: CupertinoColors.activeGreen,
                              onPressed: () {
                                orderBloc
                                    .completeOrder(widget.orderDetail.order.id);
                                Get.offAndToNamed('/success_screen');
                              },
                              child: Text(
                                "HOÀN THÀNH",
                                style: TextStyle(color: kBackgroundColor),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: MaterialButton(
                                    color: CupertinoColors.activeOrange,
                                    onPressed: () {
                                      Get.to(() => ReasonPage(type: 'PENDING'),
                                          arguments:
                                              widget.orderDetail.order.id);
                                    },
                                    child: Text(
                                      "TRÌ HOÃN",
                                      style: TextStyle(color: kBackgroundColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: MaterialButton(
                                    color: CupertinoColors.systemRed,
                                    onPressed: () {
                                      Get.to(() => ReasonPage(type: 'CANCEL'),
                                          arguments:
                                              widget.orderDetail.order.id);
                                    },
                                    child: Text(
                                      "HỦY ĐƠN",
                                      style: TextStyle(color: kBackgroundColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
