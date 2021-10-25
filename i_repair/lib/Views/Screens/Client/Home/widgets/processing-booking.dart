import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';

class ProcessingBooking extends StatelessWidget {
  const ProcessingBooking({
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
          height: 350.0,
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
                        Container(
                          child: Text("TÊN KHÁCH HÀNG: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text("Đỗ Dương Tâm Đăng"),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text("0774839222"),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                              "Chung cư Sky9, đường Liên Phường, phường Phú Hữu, TP Thủ Đức, TPHCM"),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text("0.3km"),
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
                    color: CupertinoColors.activeGreen,
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
                        onPressed: () {},
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
                              onPressed: () {},
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
                              onPressed: () {},
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
