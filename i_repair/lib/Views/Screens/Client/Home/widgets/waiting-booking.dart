import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Customer/customer.dart';
import 'package:i_repair/Models/Order/order.dart';
import 'package:intl/intl.dart';
import 'dart:math' show asin, cos, pow, sqrt;

import 'package:provider/provider.dart';

class WaitingBooking extends StatefulWidget {
  final Order order;
  const WaitingBooking({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  _WaitingBookingState createState() => _WaitingBookingState();
}

class _WaitingBookingState extends State<WaitingBooking> {
  double? distance;
  Timer? _timer;
  Customer? customer;
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
    _fetchCustomer();
    const fiveSec = const Duration(seconds: 5);
    _fetchDistance();
    _timer = new Timer.periodic(fiveSec, (Timer t) {
      _fetchDistance();
    });
  }

  _fetchCustomer() async {
    final orderBloc = Provider.of<OrderBloc>(context, listen: false);
    await orderBloc.getCustomer(widget.order.customerId);
    if (orderBloc.customer != null) {
      customer = orderBloc.customer;
    }
  }

  _fetchDistance() async {
    final orderBloc = Provider.of<OrderBloc>(context, listen: false);
    if (this.mounted && orderBloc.locationData != null) {
      setState(() => {
            distance = calculateDistance(
                widget.order.lat,
                widget.order.lng,
                orderBloc.locationData!.latitude,
                orderBloc.locationData!.longitude),
          });
    }
  }

  @override
  bool get mounted => super.mounted;
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderBloc>(context);
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('XÁC NHẬN NHẬN ĐƠN'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text("Nhấn 'Xác nhận' để nhận đơn."),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Xác nhận'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Hủy'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return (orderBloc.isLoading || this.customer == null)
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
                height: 330.0,
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
                                child: Text("${widget.order.createTime}"),
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
                                child: Text("Tủ lạnh"),
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
                                    "Kiểm tra và sửa chữa toàn bộ lốc máy"),
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
                                    "${NumberFormat.currency(locale: 'vi').format(widget.order.total)}"),
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
                                child: Text("${customer!.fullName}"),
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
                                child: Text("${customer!.phoneNumber}"),
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
                                child: Text("${widget.order.customerAddress}"),
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
                      height: 20,
                      thickness: 1,
                      indent: 30,
                      endIndent: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          color: CupertinoColors.activeGreen,
                          onPressed: _showMyDialog,
                          child: Text(
                            "NHẬN ĐƠN",
                            style: TextStyle(color: kBackgroundColor),
                          ),
                        ),
                        MaterialButton(
                          color: CupertinoColors.systemRed,
                          onPressed: () {},
                          child: Text(
                            "TỪ CHỐI",
                            style: TextStyle(color: kBackgroundColor),
                          ),
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
