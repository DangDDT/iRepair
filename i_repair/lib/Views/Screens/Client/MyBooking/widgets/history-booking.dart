import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:intl/intl.dart';

class HistoryBooking extends StatelessWidget {
  final OrderDetail orderDetail;
  const HistoryBooking({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), side: BorderSide.none),
        child: Container(
          height: 260.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment(9, 1), // 10% of the width, so there are ten blinds.
              colors: <Color>[
                kBackgroundColor,
                (orderDetail.order.status == 3) ? Colors.green : Colors.red
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text("ĐỒ CẦN SỬA: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text("${orderDetail.field.name}"),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text("${orderDetail.service.serviceName}"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text("CHI PHÍ: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text(
                              "${NumberFormat.currency(locale: 'vi').format(orderDetail.order.total)}"),
                        )
                      ],
                    ),
                    Divider(
                      height: 15,
                      thickness: 1,
                      indent: 0,
                      endIndent: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text("TÊN THỢ : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child:
                                        Text("${orderDetail.repairman.name}"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("CÔNG TY: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(
                                        "${orderDetail.company.companyName}"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("THỜI GIAN TẠO: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(
                                        "${DateTime.parse(orderDetail.order.createTime!).toString().split(".")[0]}"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              if (orderDetail.order.status == 3)
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("TÌNH TRẠNG: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          child: Text("ĐÃ HOÀN THÀNH",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("ĐÁNH GIÁ CỦA BẠN: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          child: (orderDetail
                                                      .order.feedbackPoint ==
                                                  null)
                                              ? Text("Không có đánh giá")
                                              : Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: (orderDetail.order
                                                                  .feedbackPoint! >=
                                                              1)
                                                          ? kSecondaryColor
                                                          : Colors.grey,
                                                      size: 14,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: (orderDetail.order
                                                                  .feedbackPoint! >=
                                                              2)
                                                          ? kSecondaryColor
                                                          : Colors.grey,
                                                      size: 14,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: (orderDetail.order
                                                                  .feedbackPoint! >=
                                                              3)
                                                          ? kSecondaryColor
                                                          : Colors.grey,
                                                      size: 14,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: (orderDetail.order
                                                                  .feedbackPoint! >=
                                                              4)
                                                          ? kSecondaryColor
                                                          : Colors.grey,
                                                      size: 14,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: (orderDetail.order
                                                                  .feedbackPoint! >=
                                                              5)
                                                          ? kSecondaryColor
                                                          : Colors.grey,
                                                      size: 14,
                                                    ),
                                                  ],
                                                ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("TÌNH TRẠNG: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          child: Text("ĐÃ HỦY",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    (orderDetail.order.cancelPerson == 1)
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                                Container(
                                                  child: Text("BẠN HỦY DO: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Container(
                                                    width: 140,
                                                    child: Text(
                                                      "${orderDetail.order.cancelReason}.",
                                                    ))
                                              ])
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                                Container(
                                                  child: Text("THỢ HỦY DO: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Container(
                                                    width: 140,
                                                    child: Text(
                                                      "${orderDetail.order.cancelReason}.",
                                                    ))
                                              ]),
                                  ],
                                )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              (orderDetail.repairman.avatar == 'none')
                                  ? Icon(CupertinoIcons.profile_circled,
                                      size: 70)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        orderDetail.repairman.avatar,
                                        height: 70,
                                        width: 70,
                                      ),
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (orderDetail.order.status == 3 &&
                        orderDetail.order.feedbackPoint == null &&
                        orderDetail.order.feedbackMessage == null)
                      Container(
                        padding: EdgeInsets.only(right: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              color: CupertinoColors.systemGreen,
                              onPressed: () {
                                Get.toNamed("/rating",
                                    arguments: orderDetail.order.id);
                              },
                              child: Text(
                                "ĐÁNH GIÁ",
                                style: TextStyle(color: kBackgroundColor),
                              ),
                            ),
                          ],
                        ),
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
