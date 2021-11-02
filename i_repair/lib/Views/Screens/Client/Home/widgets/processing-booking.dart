import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ProcessingBooking extends StatelessWidget {
  final OrderDetail orderDetail;
  const ProcessingBooking({
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
          height: 380.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment(9, 1), // 10% of the width, so there are ten blinds.
              colors: (orderDetail.order.status == 0)
                  ? <Color>[kBackgroundColor, kPrimaryColor]
                  : <Color>[
                      kBackgroundColor,
                      kSecondaryLightColor
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
                      height: 20,
                      thickness: 1,
                      indent: 0,
                      endIndent: 20,
                    ),
                    Row(
                      children: [
                        Column(
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
                                  child: Text("${orderDetail.repairman.name}"),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: Text(
                                      "${orderDetail.repairman.phoneNumber}"),
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
                                  child: Text("CÔNG TY: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width: 150,
                                  child: Text(
                                      "${orderDetail.company.companyName}"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            (orderDetail.repairman.avatar == 'none')
                                ? Icon(CupertinoIcons.profile_circled, size: 70)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      orderDetail.repairman.avatar,
                                      height: 70,
                                      width: 70,
                                    ),
                                  )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      child: Text("ĐỊA CHỈ CÔNG TY: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 200,
                      child: Text("${orderDetail.company.address}"),
                    )
                  ],
                ),
              ),
              Divider(
                height: 20,
                thickness: 1,
                indent: 30,
                endIndent: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Container(
                      child: Text("THỜI GIAN TẠO: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: Text(
                          "${DateTime.parse(orderDetail.order.createTime!).toString().split(".")[0]}"),
                    )
                  ],
                ),
              ),
              if (orderDetail.order.status == 0)
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        child: Text("TRẠNG THÁI: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          child: Text(
                        "Thợ đang đến",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                )
              else
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        child: Text("TRẠNG THÁI: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text(
                            "Đang trì hoãn do ${orderDetail.order.pendingReason.toString().toLowerCase()}",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: CupertinoColors.systemRed,
                    onPressed: () {
                      Get.toNamed("/cancel_page",
                          arguments: orderDetail.order.id);
                    },
                    child: Text(
                      "HỦY YÊU CẦU",
                      style: TextStyle(color: kBackgroundColor),
                    ),
                  ),
                  MaterialButton(
                    color: CupertinoColors.systemGreen,
                    onPressed: () => {
                      launch("tel://${orderDetail.repairman.phoneNumber}"),
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: kBackgroundColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "GỌI ĐIỆN CHO THỢ",
                          style: TextStyle(color: kBackgroundColor),
                        ),
                      ],
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
