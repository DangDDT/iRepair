import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class CanceledBooking extends StatefulWidget {
  final OrderDetail orderDetail;
  const CanceledBooking({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  _CanceledBookingState createState() => _CanceledBookingState();
}

class _CanceledBookingState extends State<CanceledBooking> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide.none),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(
                        9, 1), // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      kBackgroundColor,
                      Colors.red,
                    ], // red to yellow
                    tileMode:
                        TileMode.clamp, // repeats the gradient over the canvas
                  ),
                ),
                height: 210.0,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Column(
                        children: [
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
                            height: 10,
                            thickness: 1,
                            indent: 0,
                            endIndent: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("NGÀY TẠO: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(
                                    "${DateTime.parse(widget.orderDetail.order.createTime).toString().split(".")[0]}"),
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
                                child: Text(
                                    (widget.orderDetail.order.cancelPerson == 1)
                                        ? "KHÁCH HÀNG HỦY DO: "
                                        : "BẠN HỦY DO: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                width: 170,
                                child: Text(
                                    "${widget.orderDetail.order.cancelReason.toString().replaceAll("thợ", "bạn")}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
