import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/gridview-buttons.dart';
import 'package:i_repair/Views/common/card/icon-card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment(1, 1), // 10% of the width, so there are ten blinds.
              colors: <Color>[
                kPrimaryColor,
                kPrimaryLightColor
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: Container(
              padding: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      CupertinoIcons.profile_circled,
                      size: 50,
                      color: kBackgroundColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chúc một ngày mới tốt lành, ',
                            style: TextStyle(
                                fontSize: 16, color: kBackgroundColor)),
                        Text('Phạm Hữu Nghĩa',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: kBackgroundColor)),
                      ],
                    ),
                  )
                ],
              )),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Text('YÊU CẦU ĐANG XỬ LÝ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kPrimaryColor)),
        ),
        Container(
          height: 190,
          padding: EdgeInsets.all(5),
          width: size.width,
          child: InkWell(
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('CHI TIẾT YÊU CẦU',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      content: Container(
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 30,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Text('Đồ cần sửa:  '),
                                Text("Máy giặt",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Hãng:  '),
                                Text("Panasonic",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Vấn đề:  '),
                                Text("Cửa bị chênh hoặc không kín",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Divider(
                              height: 30,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset("assets/images/avatar.jpg",
                                    height: 70, width: 70),
                              ),
                            ),
                            Row(
                              children: [
                                Text('Khách hàng: '),
                                Text("Đỗ Dương Tâm Đăng",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(width: 75, child: Text('Địa chỉ: ')),
                                Container(
                                  width: 200,
                                  child: Text(
                                      "Chung cư Sky9, đường Liên Phường, quận 9, TPHCM",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Số điện thoại: '),
                                Text("0774839222",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Text('Ngày tạo:  '),
                                Text("30/09/2021",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Đóng')),
                      ],
                    );
                  })
            },
            child: Card(
              elevation: 5,
              shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Text('MÃ YÊU CẦU: A121',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      color: kSecondaryLightColor))),
                          Container(
                              margin: EdgeInsets.only(left: 20, top: 5),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text('ĐỒ CẦN SỬA: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold)),
                                    Text('Máy giặt',
                                        style: TextStyle(
                                            fontSize: 14, color: kTextColor)),
                                  ],
                                ),
                              )),
                          SizedBox(height: 5),
                          Container(
                              margin: EdgeInsets.only(left: 20, top: 0),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text('VẤN ĐỀ GẶP PHẢI: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      child: Text('Cửa bị chênh hoặc không kín',
                                          style: TextStyle(
                                              fontSize: 14, color: kTextColor)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 45, top: 10),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                  onTap: () => {Get.offAndToNamed("/rating")},
                                  child: Text(
                                    "BÁO CÁO",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kBackgroundColor,
                                        fontSize: 12),
                                  ))),
                          Container(
                              margin: EdgeInsets.only(left: 45, top: 5),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                  onTap: () => {Get.offAndToNamed("/map")},
                                  child: Text(
                                    "BẢN ĐỒ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kBackgroundColor,
                                        fontSize: 12),
                                  ))),
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 5,
                            ),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => {Get.offAndToNamed("/cancel_page")},
                              child: Text(
                                "HỦY",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kBackgroundColor,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Icon(Icons.person)),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Đỗ Dương Tâm Đăng')),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: Text('Ngày 30/09/2021')),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 0),
                            child: Text('Đã nhận yêu cầu',
                                style: TextStyle(color: kPrimaryColor))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Text('YÊU CẦU ĐANG TRÌ HOÃN',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kPrimaryColor)),
        ),
        Container(
          height: 180,
          padding: EdgeInsets.all(5),
          width: size.width,
          child: InkWell(
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('CHI TIẾT YÊU CẦU',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      content: Container(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 15,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Text('Đồ cần sửa:  '),
                                Text("Ống nước",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Hãng:  '),
                                Text("Khác: Thái Long",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Vấn đề:  '),
                                Text("Vỡ ống nước nhà tắm",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Divider(
                              height: 30,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                    "https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.6435-9/135090916_1331932087169648_6344578304214591181_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=F4SVrapJ8sMAX-Tg1sM&_nc_ht=scontent.fsgn5-6.fna&oh=288679314910bff7aeda46333245c387&oe=618595DD",
                                    height: 70,
                                    width: 70),
                              ),
                            ),
                            Row(
                              children: [
                                Text('Khách hàng: '),
                                Text("Lưu Thy Huyền",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(width: 75, child: Text('Địa chỉ: ')),
                                Container(
                                  width: 200,
                                  child: Text(
                                      "Số 3 đường Phú Nhơn, quận 2, TPHCM",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Số điện thoại: '),
                                Text("08918276162",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Text('Ngày tạo:  '),
                                Text("29/09/2021",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Tình trạng:  '),
                                Text("Đợi vật liệu từ nhà cung cấp",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Đóng')),
                      ],
                    );
                  })
            },
            child: Card(
              elevation: 5,
              shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 20),
                              child: Text('MÃ YÊU CẦU: A120',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      color: kSecondaryLightColor))),
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 5),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text('ĐỒ CẦN SỬA: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold)),
                                    Text('Ống nước',
                                        style: TextStyle(
                                            fontSize: 14, color: kTextColor)),
                                  ],
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 0),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text('VẤN ĐỀ GẶP PHẢI: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      child: Text('Vỡ ống nước nhà tắm',
                                          style: TextStyle(
                                              fontSize: 14, color: kTextColor)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 90,
                              top: 5,
                            ),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => {},
                              child: Text(
                                "SỬA TIẾP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kBackgroundColor,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Icon(Icons.person)),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Lưu Thy Huyền')),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text('Ngày 29/09/2021')),
                        VerticalDivider(
                          width: 30,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text('Đang trì hoãn',
                                style: TextStyle(color: Colors.brown))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Text('YÊU CẦU VỪA NHẬN TIẾP THEO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kPrimaryColor)),
        ),
        Container(
          height: 180,
          padding: EdgeInsets.all(5),
          width: size.width,
          child: InkWell(
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('CHI TIẾT YÊU CẦU',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      content: Container(
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 30,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Text('Đồ cần sửa:  '),
                                Text("Tủ lạnh",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Hãng:  '),
                                Text("Panasonic",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Vấn đề:  '),
                                Text("Tủ lạnh đóng tuyết nhiều ngăn đông",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Divider(
                              height: 30,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                    "https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.6435-9/135090916_1331932087169648_6344578304214591181_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=F4SVrapJ8sMAX-Tg1sM&_nc_ht=scontent.fsgn5-6.fna&oh=288679314910bff7aeda46333245c387&oe=618595DD",
                                    height: 70,
                                    width: 70),
                              ),
                            ),
                            Row(
                              children: [
                                Text('Khách hàng: '),
                                Text("Phạm Tấn Phát",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(width: 75, child: Text('Địa chỉ: ')),
                                Container(
                                  width: 200,
                                  child: Text(
                                      "130 Nguyễn Văn Chiêu, quận 11, TPHCM",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Số điện thoại: '),
                                Text("0882918212",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Text('Ngày tạo:  '),
                                Text("30/09/2021",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Đóng')),
                      ],
                    );
                  })
            },
            child: Card(
              elevation: 5,
              shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 20),
                              child: Text('MÃ YÊU CẦU: A122',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      color: kSecondaryLightColor))),
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 5),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text('ĐỒ CẦN SỬA: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold)),
                                    Text('Tủ lạnh',
                                        style: TextStyle(
                                            fontSize: 14, color: kTextColor)),
                                  ],
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 0),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text('VẤN ĐỀ GẶP PHẢI: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      child: Text(
                                          'Tủ lạnh đóng tuyết nhiều ngăn đông',
                                          style: TextStyle(
                                              fontSize: 14, color: kTextColor)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 5,
                            ),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => {},
                              child: Text(
                                "ĐỒNG Ý",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kBackgroundColor,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 5,
                            ),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => {Get.offAndToNamed("/cancel_page")},
                              child: Text(
                                "TỪ CHỐI",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kBackgroundColor,
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Icon(Icons.person)),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Phạm Tấn Phát')),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text('Ngày 30/09/2021')),
                        VerticalDivider(
                          width: 30,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text('Đợi nhận yêu cầu',
                                style: TextStyle(color: kPrimaryLightColor))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
