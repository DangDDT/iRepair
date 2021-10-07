import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:image_picker/image_picker.dart';

class BookServiceScreen extends StatefulWidget {
  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  ImagePicker _picker = ImagePicker();
  var selectedImage = [];
  MajorModel selectedMajor = majorList[0];
  Repairman selectedRepairman = Repairman('', '', 0, 0, 'none', '');
  final _formKey = GlobalKey<FormState>();
  String? _currentProlemnState;
  TextEditingController? _currentProlemnController;
  int? _stepIndex;
  @override
  void initState() {
    super.initState();
    selectedImage = [];
    _currentProlemnController = new TextEditingController();
    _currentProlemnController!.text = 'Bảo trì và bơm gas tủ lạnh';
    _stepIndex = 0;
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
                ? 480
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
                                    padding: EdgeInsets.only(left: 25),
                                    child: Text('B2: Chọn thợ sửa chữa',
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
                      height: (_stepIndex == 0) ? 280 : 400,
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
                                    Form(
                                      key: _formKey,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30, top: 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Vui lòng nhập vấn đề bạn gặp';
                                            }
                                            return null;
                                          },
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
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        'Bạn cần sửa chữa: ',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 50),
                                              child: Text(selectedMajor.name,
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              alignment: Alignment.centerRight,
                                              child: ElevatedButton(
                                                child: Text('CHỌN ĐỒ VẬT'),
                                                onPressed: () =>
                                                    showMaterialScrollPicker<
                                                        MajorModel>(
                                                  context: context,
                                                  title:
                                                      'CHỌN ĐỒ VẬT BẠN CẦN SỬA',
                                                  items: majorList,
                                                  selectedItem: selectedMajor,
                                                  onChanged: (value) =>
                                                      setState(() =>
                                                          selectedMajor =
                                                              value),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]
                                : (_stepIndex == 1)
                                    ? [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'TÔI MUỐN CHỌN THỢ',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                color: kPrimaryColor),
                                          ),
                                        ),
                                        Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: GridView.count(
                                            scrollDirection: Axis.vertical,
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 5,
                                            children: List.generate(
                                                repairmanListByMajor(
                                                        selectedMajor.code)
                                                    .length, (index) {
                                              Repairman repairman =
                                                  repairmanListByMajor(
                                                      selectedMajor
                                                          .code)[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedRepairman =
                                                        repairman;
                                                  });
                                                },
                                                child: Card(
                                                  margin: EdgeInsets.all(10),
                                                  shape: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  color:
                                                      (selectedRepairman.code ==
                                                              repairman.code)
                                                          ? kPrimaryLightColor
                                                              .withOpacity(0.8)
                                                          : Colors.white,
                                                  elevation: 10,
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: (repairman
                                                                      .avatar ==
                                                                  'none')
                                                              ? Icon(
                                                                  CupertinoIcons
                                                                      .person_circle,
                                                                  size: 70)
                                                              : ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  child: Image.network(
                                                                      repairman
                                                                          .avatar,
                                                                      width:
                                                                          70),
                                                                ),
                                                        ),
                                                        Text(
                                                          repairman.name,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kTextColor),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(Icons.star,
                                                                color: (repairman
                                                                            .rating >=
                                                                        1)
                                                                    ? kSecondaryColor
                                                                    : kTextColor),
                                                            Icon(Icons.star,
                                                                color: (repairman
                                                                            .rating >=
                                                                        2)
                                                                    ? kSecondaryColor
                                                                    : kTextColor),
                                                            Icon(Icons.star,
                                                                color: (repairman
                                                                            .rating >=
                                                                        3)
                                                                    ? kSecondaryColor
                                                                    : kTextColor),
                                                            Icon(Icons.star,
                                                                color: (repairman
                                                                            .rating >=
                                                                        4)
                                                                    ? kSecondaryColor
                                                                    : kTextColor),
                                                            Icon(Icons.star,
                                                                color: (repairman
                                                                            .rating >=
                                                                        5)
                                                                    ? kSecondaryColor
                                                                    : kTextColor)
                                                          ],
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '${repairman.distance} km'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        )
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
                                              top: 10, left: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 90,
                                                child: Text('VẤN ĐỀ: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                width: 250,
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: Text(
                                                    '$_currentProlemnState',
                                                    style: TextStyle(
                                                        fontSize: 14)),
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
                                                width: 90,
                                                child: Text('ĐỒ CẦN SỬA: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                  child: Text(
                                                      selectedMajor.name,
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 90,
                                                child: Text('THỢ: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                  child: Text(
                                                      selectedRepairman.name,
                                                      style: TextStyle(
                                                          fontSize: 14)))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text('HÌNH ẢNH MINH HỌA: ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        if (selectedImage.length != 0)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: size.width * 0.8,
                                                height: 120,
                                                child: ListView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    children: List.generate(
                                                        selectedImage.length,
                                                        (index) {
                                                      return Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Image.file(
                                                          selectedImage[index],
                                                          width: 100.0,
                                                          height: 100.0,
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      );
                                                    })),
                                              ),
                                            ],
                                          )
                                        else
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 20),
                                              child: Text(
                                                  'Không có hình ảnh minh họa',
                                                  style:
                                                      TextStyle(fontSize: 14)))
                                      ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          (_stepIndex == 0)
              ? Container(
                  margin:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 5),
                  child: (selectedImage.isEmpty)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  XFile? image = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    selectedImage.add(File(image!.path));
                                  });
                                },
                                icon: Icon(Icons.camera_alt)),
                            Text('Chụp ảnh đính kèm'),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: size.width,
                                height: 300,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                        selectedImage.length, (index) {
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        child: Image.file(
                                          selectedImage[index],
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      );
                                    })),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      XFile? image = await _picker.pickImage(
                                          source: ImageSource.camera);
                                      setState(() {
                                        selectedImage.add(File(image!.path));
                                      });
                                    },
                                    icon: Icon(Icons.add_a_photo)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedImage = [];
                                      });
                                    },
                                    icon: Icon(Icons.delete_forever)),
                              ],
                            )
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
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _currentProlemnState =
                              _currentProlemnController!.text;
                          _stepIndex = 1;
                        });
                      }
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
                                selectedRepairman =
                                    Repairman('', '', 0, 0, 'none', '');
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
                              colors: (selectedRepairman.code != '')
                                  ? <Color>[
                                      kSecondaryLightColor,
                                      kSecondaryColor,
                                    ]
                                  : <Color>[
                                      Colors.grey,
                                      Colors.grey,
                                    ], // red to yellow
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (selectedRepairman.code != '') {
                                setState(() {
                                  _stepIndex = 2;
                                });
                              }
                            },
                            child: Text('Chốt đơn'),
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

class MajorModel {
  const MajorModel(this.name, this.code);
  final String code;
  final String name;
  @override
  String toString() => name;
}

class Repairman {
  const Repairman(this.name, this.code, this.distance, this.rating, this.avatar,
      this.majorCode);
  final String code;
  final String name;
  final double distance;
  final int rating;
  final String avatar;
  final String majorCode;
}

const List<MajorModel> majorList = <MajorModel>[
  MajorModel('Tủ lạnh', 'TL'),
  MajorModel('Xe máy', 'X2'),
  MajorModel('Máy giặt', 'MG'),
  MajorModel('Điện thoại', 'ĐT'),
  MajorModel('Laptop', 'LT'),
  MajorModel('Xe ôtô', 'X4'),
  MajorModel('Ống nước', 'ON'),
];

const List<Repairman> repairmanList = <Repairman>[
  Repairman(
      "Phạm Tấn Phát",
      'R00001',
      0.3,
      3,
      "https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.6435-9/135090916_1331932087169648_6344578304214591181_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=F4SVrapJ8sMAX-Tg1sM&_nc_ht=scontent.fsgn5-6.fna&oh=288679314910bff7aeda46333245c387&oe=618595DD",
      "TL"),
  Repairman(
      "Vũ Phi Long",
      'R00002',
      0.3,
      4,
      "https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/89471558_2661034714138926_7334722076097380352_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=V0KQqy1tptwAX9cBOEe&_nc_ht=scontent.fsgn5-11.fna&oh=8f20c400ad006752911e7d7fd2ebbb96&oe=6183B008",
      "X2"),
  Repairman(
      "Nguyễn Phi Long",
      'R00003',
      5.5,
      3,
      "https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/47326142_1170771333099896_4919208150722150400_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=174925&_nc_ohc=eYuhQgOA6l4AX_HXHQo&tn=DpUZyiwjEV2LUXq3&_nc_ht=scontent.fsgn5-10.fna&oh=e95c1cafe90c27455b75ff5ee766b942&oe=618200B8",
      "MG"),
  Repairman(
      "Nguyễn Thuần",
      'R00004',
      1.5,
      4,
      "https://scontent.fsgn5-9.fna.fbcdn.net/v/t39.30808-6/217621601_1467637380256743_6771480550308407712_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=QOVxcjdDwvkAX-6xNrH&_nc_ht=scontent.fsgn5-9.fna&oh=6bea423ca2866baebaa36ceb26fe5ee5&oe=6163E041",
      "ĐT"),
  Repairman(
      "Lê Tấn Thịnh",
      'R00005',
      1.5,
      4,
      "https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/193024051_2458304014315692_1000004856554295334_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Jt6Py7q9oNsAX9lB5du&_nc_ht=scontent.fsgn5-11.fna&oh=6521f63d23ab07faa8ecb1386d8e4902&oe=61846475",
      "LT"),
  Repairman(
      "Nguyễn Minh Châu",
      'R00006',
      0.4,
      3,
      "https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/134128865_1327574057615835_8691594146851068400_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=174925&_nc_ohc=9cnRGubufJ4AX8qSUhU&_nc_ht=scontent.fsgn5-5.fna&oh=5c121bc10bb919a0f65a3737415279d3&oe=61857BBE",
      "X4"),
  Repairman(
      "Nguyễn Duy Anh",
      'R00007',
      1.0,
      4,
      "https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/37258184_872056529631501_7229243735211507712_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=174925&_nc_ohc=86G9oLGQUJsAX9EKD0X&tn=DpUZyiwjEV2LUXq3&_nc_ht=scontent.fsgn5-9.fna&oh=5a853f340b7ce814c2766524ab0b7f4f&oe=6181E88C",
      "ON"),
  Repairman(
      "Phạm Hữu Nghĩa",
      'R00008',
      0.7,
      3,
      "https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/145490152_1645861872468232_2404576525271328519_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=-KKRXEcThkEAX-VQeMP&_nc_ht=scontent.fsgn5-8.fna&oh=5dfe93870e948990400b19eafa9ebd6e&oe=6183DEBC",
      "TL"),
  Repairman(
      "Nguyễn Quốc Khánh",
      'R00009',
      1.0,
      4,
      "https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.6435-9/80389988_564294717757002_6559485070489419776_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_Q-sC4vgFLMAX-_D411&_nc_ht=scontent.fsgn5-4.fna&oh=3b91b4f467d5a992c3b70dd05eb72a59&oe=6182222E",
      "TL"),
  Repairman(
      "Lưu Lập Hòa",
      'R000010',
      0.2,
      3,
      "https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/s552x414/33569195_546359705780742_2182061124030038016_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=174925&_nc_ohc=6wfawH4BJKoAX82D73f&_nc_ht=scontent.fsgn5-10.fna&oh=e6b44d2c70595783467b746c8288af22&oe=6185047E",
      "MG"),
  Repairman(
      "Trần Phú Sơn",
      'R000011',
      1.5,
      3,
      "https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.6435-9/202304614_1109701929525145_4801822179073318783_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_ohc=v0_5ZoxDkZMAX9YxbTq&_nc_ht=scontent.fsgn5-4.fna&oh=56704a903b1904f05f2e807c33539131&oe=6184804C",
      "ĐT"),
  Repairman(
      "Đặng Như Phong",
      'R000012',
      0.2,
      3,
      "https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.6435-9/240186103_1249129632199951_1611544894358524152_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lH4lc-W2CyIAX_pjwPp&_nc_ht=scontent.fsgn5-4.fna&oh=4ecdc5a2992a68ba46fb9d8eaec43efe&oe=61842754",
      "X2"),
  Repairman(
      "Võ Đăng Khoa",
      'R000013',
      1.5,
      3,
      "https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/141741914_1387024964973354_6463379853589425388_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=fdKbjAw0WN0AX-3BkqP&_nc_ht=scontent.fsgn5-11.fna&oh=473a0dc0a4f5181d31856c8b34c4231b&oe=618501B9",
      "X4"),
];

List<Repairman> repairmanListByMajor(String majorCode) {
  List<Repairman> list = [];
  for (Repairman r in repairmanList) {
    if (r.majorCode == majorCode) {
      list.add(r);
    }
  }
  return list;
}
