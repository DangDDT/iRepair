import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';

class PendingBooking extends StatelessWidget {
  const PendingBooking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), side: BorderSide.none),
        child: Container(
          height: 300.0,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text("NGÀY TẠO: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text("13:56:00 24/10/2021"),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text("Kiểm tra và sửa chữa toàn bộ lốc máy"),
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
                                  child: Text("Nguyễn Hoàng Quốc Khánh"),
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
                                  child: Text("0121124674"),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: Text("0.3km"),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Icon(CupertinoIcons.profile_circled, size: 100)
                          ],
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
                    color: CupertinoColors.systemRed,
                    onPressed: () {},
                    child: Text(
                      "GỌI CHO THỢ ĐỂ HỦY ĐƠN HÀNG",
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
