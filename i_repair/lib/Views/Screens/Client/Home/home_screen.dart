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
  bool _switchValue = true;
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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
                colors: _switchValue
                    ? <Color>[kPrimaryColor, kPrimaryLightColor]
                    : <Color>[Colors.black, Colors.grey], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              )),
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
                    width: 160,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            _switchValue
                                ? 'Chúc một ngày mới tốt lành, '
                                : 'Nghỉ ngơi tí nào',
                            style: TextStyle(
                                fontSize: 14, color: kBackgroundColor)),
                        Text('Phạm Hữu Nghĩa',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: kBackgroundColor)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Switch(
                          value: _switchValue,
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 15),
                        child: Column(
                          children: [
                            Text('NHẬN YÊU CẦU',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: kBackgroundColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        Container(
            child: ClipRRect(
          child: Image.asset("assets/images/banner.jpg"),
        )),
        if (_switchValue)
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text('YÊU CẦU VỪA NHẬN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kPrimaryColor)),
          ),
        !_switchValue
            ? Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/sleeping.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                          "NGHỈ NGƠI ĂN MIẾNG BÁNH UỐNG MIẾNG NƯỚC THÔI !!!"),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              content: Container(
                                height: 500,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      height: 5,
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
                                        Text("Tủ lạnh đóng tuyết ngăn đông",
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
                                        child: Image.asset(
                                            "assets/images/avatar.jpg",
                                            height: 70,
                                            width: 70),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 75,
                                            child: Text('Địa chỉ: ')),
                                        Container(
                                          width: 200,
                                          child: Text(
                                              "Chung cư Sky9, đường Liên Phường, quận 9, TPHCM.",
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
                                        Text('Hình ảnh đính kèm: '),
                                      ],
                                    ),
                                    Container(
                                      height: 120,
                                      width: 300,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(
                                            child: Image.asset(
                                              "assets/images/20191008102441-1188.jpg",
                                              height: 120,
                                              width: 120,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            child: Image.asset(
                                              "assets/images/problem-1.jpg",
                                              height: 140,
                                              width: 140,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
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
                          },
                        ),
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
                                        margin:
                                            EdgeInsets.only(left: 20, top: 20),
                                        child: Text('MÃ YÊU CẦU: A121',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: kSecondaryLightColor))),
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 20, top: 5),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Text('ĐỒ CẦN SỬA: ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text('Tủ lạnh',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor)),
                                            ],
                                          ),
                                        )),
                                    SizedBox(height: 5),
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 20, top: 0),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Text('VẤN ĐỀ GẶP PHẢI: ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Container(
                                                child: Text(
                                                    'Tủ lạnh đóng tuyết ngăn đông',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: kTextColor)),
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
                                        margin:
                                            EdgeInsets.only(left: 45, top: 10),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: InkWell(
                                            onTap: () =>
                                                {Get.offAndToNamed("/map")},
                                            child: Text(
                                              "ĐỒNG Ý",
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                        onTap: () => {},
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
                                      margin: EdgeInsets.only(left: 20),
                                      child: Icon(Icons.person)),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Đỗ Dương Tâm Đăng')),
                                  VerticalDivider(
                                    width: 90,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: Text('Ngày 30/09/2021')),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              content: Container(
                                height: 500,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      height: 5,
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
                                        Text("Tủ lạnh đóng tuyết ngăn đông",
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
                                        child: Image.asset(
                                            "assets/images/avatar.jpg",
                                            height: 70,
                                            width: 70),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 75,
                                            child: Text('Địa chỉ: ')),
                                        Container(
                                          width: 200,
                                          child: Text(
                                              "Chung cư Sky9, đường Liên Phường, quận 9, TPHCM.",
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
                                        Text('Hình ảnh đính kèm: '),
                                      ],
                                    ),
                                    Container(
                                      height: 120,
                                      width: 300,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(
                                            child: Image.asset(
                                              "assets/images/20191008102441-1188.jpg",
                                              height: 120,
                                              width: 120,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            child: Image.asset(
                                              "assets/images/problem-1.jpg",
                                              height: 140,
                                              width: 140,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
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
                          },
                        ),
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
                                        margin:
                                            EdgeInsets.only(left: 20, top: 20),
                                        child: Text('MÃ YÊU CẦU: A121',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: kSecondaryLightColor))),
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 20, top: 5),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Text('ĐỒ CẦN SỬA: ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text('Tủ lạnh',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor)),
                                            ],
                                          ),
                                        )),
                                    SizedBox(height: 5),
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 20, top: 0),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Text('VẤN ĐỀ GẶP PHẢI: ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Container(
                                                child: Text(
                                                    'Tủ lạnh đóng tuyết ngăn đông',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: kTextColor)),
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
                                        margin:
                                            EdgeInsets.only(left: 45, top: 10),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: InkWell(
                                            onTap: () =>
                                                {Get.offAndToNamed("/map")},
                                            child: Text(
                                              "ĐỒNG Ý",
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                        onTap: () => {},
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
                                      margin: EdgeInsets.only(left: 20),
                                      child: Icon(Icons.person)),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Đỗ Dương Tâm Đăng')),
                                  VerticalDivider(
                                    width: 90,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: Text('Ngày 30/09/2021')),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
