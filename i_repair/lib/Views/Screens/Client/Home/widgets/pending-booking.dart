import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';

class PendingBooking extends StatelessWidget {
  const PendingBooking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('XÁC NHẬN SỬA TIẾP'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text("Nhấn 'Xác nhận' để sửa tiếp."),
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
                height: 20,
                thickness: 1,
                indent: 0,
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
                      "SỬA TIẾP",
                      style: TextStyle(color: kBackgroundColor),
                    ),
                  ),
                  MaterialButton(
                    color: CupertinoColors.systemRed,
                    onPressed: () {},
                    child: Text(
                      "GỌI CHO KHÁCH ĐỂ HỦY",
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
