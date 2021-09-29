import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class BookServiceScreen extends StatefulWidget {
  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  DateFormat? _dateFormat;
  DateFormat? _timeFormat;
  DateTime? _dateState;
  String? _currentProlemnState;
  TextEditingController? _currentProlemnController;
  String? _nameState;
  TextEditingController? _nameController;
  String? _addressState;
  TextEditingController? _addressController;
  String? _phoneState;
  TextEditingController? _phoneController;
  int? _stepIndex;
  @override
  void initState() {
    _dateState = new DateTime.now();
    super.initState();
    initializeDateFormatting();
    _dateFormat = new DateFormat.yMMMMd('vi');
    _timeFormat = new DateFormat.Hm('vi');
    _currentProlemnController = new TextEditingController();
    _nameController = new TextEditingController();
    _addressController = new TextEditingController();
    _phoneController = new TextEditingController();
    _stepIndex = 0;
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(children: [
          Container(
            height: (_stepIndex == 0)
                ? 500
                : (_stepIndex == 1)
                    ? 580
                    : 520,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: (_stepIndex != 2) ? 250 : 140,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(0)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(
                            1, 1), // 10% of the width, so there are ten blinds.
                        colors: <Color>[
                          kPrimaryLightColor,
                          kPrimaryColor,
                        ], // red to yellow
                        tileMode: TileMode
                            .repeated, // repeats the gradient over the canvas
                      ),
                    ),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20, left: 10, bottom: 50),
                              child: IconButton(
                                onPressed: () => {Get.back()},
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: kBackgroundColor,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30, left: 0),
                              child: Text('ĐẶT LỊCH SỬA',
                                  style: TextStyle(
                                      color: kBackgroundColor, fontSize: 16)),
                            ),
                          ]),
                      (_stepIndex != 2)
                          ? Stack(children: [
                              Divider(
                                height: 20,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: kBackgroundColor,
                              ),
                              Positioned(
                                top: 0,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.25),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: kBackgroundColor),
                                        color: (_stepIndex == 0)
                                            ? kSecondaryLightColor
                                            : kPrimaryLightColor,
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    margin:
                                        EdgeInsets.only(left: size.width * 0.4),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: kBackgroundColor),
                                        color: (_stepIndex == 1)
                                            ? kSecondaryLightColor
                                            : kPrimaryLightColor,
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                  ),
                                ]),
                              ),
                            ])
                          : SizedBox(
                              height: 0,
                            ),
                      SizedBox(height: 10),
                      (_stepIndex != 2)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  Container(
                                    width: size.width * 0.5,
                                    height: 20,
                                    padding: EdgeInsets.only(left: 50),
                                    child: Text(
                                      'B1: Nhu cầu sửa chữa',
                                      style: (_stepIndex == 0)
                                          ? TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kBackgroundColor)
                                          : TextStyle(
                                              color: kBackgroundColor
                                                  .withOpacity(0.4)),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.5,
                                    height: 20,
                                    padding: EdgeInsets.only(left: 40),
                                    child: Text('B2: Thông tin liên hệ',
                                        style: (_stepIndex == 1)
                                            ? TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kBackgroundColor)
                                            : TextStyle(
                                                color: kBackgroundColor
                                                    .withOpacity(0.4))),
                                  ),
                                ])
                          : SizedBox(height: 0),
                    ]),
                  ),
                ),
                Positioned(
                    top: (_stepIndex != 2) ? 180 : 100,
                    child: Container(
                      height: (_stepIndex == 0) ? 320 : 400,
                      width: size.width,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: size.width,
                        child: Card(
                          elevation: 5,
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25)),
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: (_stepIndex == 0)
                                ? [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        'Tôi muốn: ',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 30, right: 30, top: 10),
                                      child: TextField(
                                        controller: _currentProlemnController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[800]),
                                          hintText:
                                              "Chào Đăng, bạn gặp vấn đề gì thế ?",
                                          fillColor: Colors.white70,
                                          contentPadding: EdgeInsets.all(16),
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.mic_rounded),
                                            onPressed: () => {},
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        'Vào lúc: ',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 30, right: 30),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Ngày'),
                                                Text(
                                                    _dateFormat!
                                                        .format(_dateState!),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20))
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(
                                            width: 10,
                                            thickness: 2,
                                            indent: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Giờ'),
                                                Text(
                                                    _timeFormat!
                                                        .format(_dateState!),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 80, top: 20),
                                            child: IconButton(
                                                onPressed: () {
                                                  DatePicker.showDateTimePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime:
                                                          DateTime(2018, 3, 5),
                                                      maxTime:
                                                          DateTime(2019, 6, 7),
                                                      onConfirm: (date) {
                                                    setState(
                                                      () {
                                                        _dateState = date;
                                                      },
                                                    );
                                                  },
                                                      currentTime: _dateState,
                                                      locale: LocaleType.vi);
                                                },
                                                icon: Icon(Icons.timer)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 2,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                  ]
                                : (_stepIndex == 1)
                                    ? [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            'Họ và tên: ',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: kPrimaryColor),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30, top: 10),
                                          child: TextField(
                                            controller: _nameController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(35.0),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[800]),
                                              hintText:
                                                  "Nhập họ và tên người gặp thợ",
                                              fillColor: Colors.white70,
                                              contentPadding:
                                                  EdgeInsets.all(16),
                                              prefixIcon: Icon(Icons.person),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            'Địa chỉ: ',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: kPrimaryColor),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30, top: 10),
                                          child: TextField(
                                            controller: _addressController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(35.0),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[800]),
                                              hintText: "Bạn nhà ở đâu thế ?",
                                              fillColor: Colors.white70,
                                              contentPadding:
                                                  EdgeInsets.all(16),
                                              prefixIcon:
                                                  Icon(Icons.location_on),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Text(
                                            'Số điện thoại: ',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: kPrimaryColor),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30, top: 10),
                                          child: TextField(
                                            controller: _phoneController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(35.0),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[800]),
                                              hintText:
                                                  "Cho mình xin số điện thoại nhé ",
                                              fillColor: Colors.white70,
                                              contentPadding:
                                                  EdgeInsets.all(16),
                                              prefixIcon: Icon(Icons.phone),
                                            ),
                                          ),
                                        ),
                                      ]
                                    : [
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Text(
                                                  'CHÚC MỪNG BẠN ĐÃ ĐẶT LỊCH THÀNH CÔNG',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: kSecondaryColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                                'Bạn vui lòng đợi trong ít phút, thợ sẽ liên hệ với bạn để xác nhận thông tin.'),
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("Thông tin đơn hàng",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text('Dịch vụ: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: Text(
                                                    '$_currentProlemnState'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text('Thời gian: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                  child: Text(_timeFormat!
                                                          .format(_dateState!) +
                                                      ' , ngày ' +
                                                      _dateFormat!
                                                          .format(_dateState!)))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text('Họ và tên: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                  child: Text(_nameState!))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text('Địa chỉ: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                  child: Text(_addressState!))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text('Số điện thoại: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                  child: Text(_phoneState!))
                                            ],
                                          ),
                                        ),
                                      ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          (_stepIndex == 0)
              ? IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 30, right: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () => {}, icon: Icon(Icons.photo)),
                            Text('Ảnh đính kèm'),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        width: 10,
                        thickness: 2,
                        indent: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 50, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () => {},
                                icon: Icon(CupertinoIcons.percent)),
                            Text('Mã khuyến mãi'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 0,
                ),
          (_stepIndex == 0)
              ? Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(
                          1, 1), // 10% of the width, so there are ten blinds.
                      colors: <Color>[
                        kSecondaryLightColor,
                        kSecondaryColor,
                      ], // red to yellow
                      tileMode: TileMode
                          .repeated, // repeats the gradient over the canvas
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentProlemnState = _currentProlemnController!.text;
                        _stepIndex = 1;
                      });
                      print(_currentProlemnState);
                      print(_stepIndex);
                    },
                    child: Text('Tiếp tục'),
                  ),
                )
              : (_stepIndex == 1)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(1,
                                  1), // 10% of the width, so there are ten blinds.
                              colors: <Color>[
                                kSecondaryLightColor,
                                kSecondaryColor,
                              ], // red to yellow
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                _nameState = _nameController!.text;
                                _addressState = _addressController!.text;
                                _phoneState = _phoneController!.text;
                                _stepIndex = 0;
                              });
                            },
                            child: Text('Quay lại'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(1,
                                  1), // 10% of the width, so there are ten blinds.
                              colors: <Color>[
                                kSecondaryLightColor,
                                kSecondaryColor,
                              ], // red to yellow
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                _nameState = _nameController!.text;
                                _addressState = _addressController!.text;
                                _phoneState = _phoneController!.text;
                                _stepIndex = 2;
                              });
                            },
                            child: Text('Đặt lịch'),
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(1,
                                  1), // 10% of the width, so there are ten blinds.
                              colors: <Color>[
                                kPrimaryColor,
                                kPrimaryLightColor,
                              ], // red to yellow
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () =>
                                {Get.offAndToNamed("/book_service")},
                            child: Text('Tiếp tục tạo lịch hẹn mới'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(1,
                                  1), // 10% of the width, so there are ten blinds.
                              colors: <Color>[
                                kSecondaryLightColor,
                                kSecondaryColor,
                              ], // red to yellow
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () => {Get.offAndToNamed("/client_app")},
                            child: Text('Quay lại trang chủ'),
                          ),
                        )
                      ],
                    )
        ]),
      ),
    );
  }
}
