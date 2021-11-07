import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class CompletedBooking extends StatefulWidget {
  final OrderDetail orderDetail;
  const CompletedBooking({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  _CompletedBookingState createState() => _CompletedBookingState();
}

class _CompletedBookingState extends State<CompletedBooking> {
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
                      Colors.green,
                    ], // red to yellow
                    tileMode:
                        TileMode.clamp, // repeats the gradient over the canvas
                  ),
                ),
                height: 230.0,
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
                            children: [
                              Container(
                                child: Text("ĐÁNH GIÁ: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: (widget
                                            .orderDetail.order.feedbackPoint ==
                                        null)
                                    ? Text("Đang đợi khách hàng đánh giá...")
                                    : Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: (widget.orderDetail.order
                                                        .feedbackPoint! >=
                                                    1)
                                                ? kPrimaryColor
                                                : Colors.grey,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: (widget.orderDetail.order
                                                        .feedbackPoint! >=
                                                    2)
                                                ? kPrimaryColor
                                                : Colors.grey,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: (widget.orderDetail.order
                                                        .feedbackPoint! >=
                                                    3)
                                                ? kPrimaryColor
                                                : Colors.grey,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: (widget.orderDetail.order
                                                        .feedbackPoint! >=
                                                    4)
                                                ? kPrimaryColor
                                                : Colors.grey,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: (widget.orderDetail.order
                                                        .feedbackPoint! >=
                                                    5)
                                                ? kPrimaryColor
                                                : Colors.grey,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text("PHẢN HỒI: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: (widget.orderDetail.order
                                            .feedbackMessage ==
                                        null)
                                    ? Text("Đang đợi khách hàng phản hồi...")
                                    : Row(
                                        children: [
                                          Text(
                                              "${widget.orderDetail.order.feedbackMessage}"),
                                        ],
                                      ),
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
