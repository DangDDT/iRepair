import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Brand/brand.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/MajorModel/majorModel.dart';
import 'package:i_repair/Models/Problem/problem.dart';
import 'package:i_repair/Models/Repairman/repairman.dart';
import 'package:image_picker/image_picker.dart';

class BookServiceScreen extends StatefulWidget {
  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  ImagePicker _picker = ImagePicker();
  var selectedImage = [];

  MajorModel selectedMajor = MajorModel("none", "none");
  Brand selectedBrand = Brand("none", "none", []);
  Problem selectedProblem = Problem("none", "none", []);
  Repairman selectedRepairman = Repairman('', '', 0, 0, 'none', '');

  String? _currentProlemnState;
  TextEditingController? _currentProlemnController;
  int? _stepIndex;

  @override
  void initState() {
    super.initState();
    selectedImage = [];
    _currentProlemnController = new TextEditingController();
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
            height: 620,
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
                              child: Text('TÌM THỢ',
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
                                    child: Text('B2: Xác nhận thông tin',
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
                    top: (_stepIndex != 2) ? 180 : 60,
                    child: Container(
                      height: (_stepIndex == 0)
                          ? 400
                          : (_stepIndex == 1)
                              ? 430
                              : 460,
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
                                          EdgeInsets.only(left: 20, top: 15),
                                      child: Text(
                                        'Tôi cần sửa chữa: ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 30),
                                              child: (selectedMajor.code !=
                                                      "none")
                                                  ? Text(selectedMajor.name,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                  : Text(
                                                      "< Mời bạn chọn thiết bị >",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              alignment: Alignment.centerRight,
                                              child: ElevatedButton(
                                                child: Text('CHỌN THIẾT BỊ'),
                                                onPressed: () =>
                                                    showMaterialRadioPicker<
                                                        MajorModel>(
                                                  context: context,
                                                  title:
                                                      'CHỌN THIẾT BỊ BẠN CẦN SỬA',
                                                  items: majorList,
                                                  selectedItem: selectedMajor,
                                                  onChanged: (value) =>
                                                      setState(() {
                                                    selectedMajor = value;
                                                    selectedProblem =
                                                        getProblemsByMajor(
                                                            selectedMajor
                                                                .code)[0];
                                                    selectedBrand =
                                                        getBrandByMajor(
                                                            selectedMajor
                                                                .code)[0];
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20, top: 5),
                                      child: Text(
                                        'Hãng Sản Xuất: ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 220,
                                            margin: EdgeInsets.only(left: 30),
                                            child: (selectedBrand.code !=
                                                    "none")
                                                ? Text(selectedBrand.name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))
                                                : Text(
                                                    "< Chưa có hãng sản xuất >",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              alignment: Alignment.centerRight,
                                              child: (selectedMajor.code !=
                                                      "none")
                                                  ? ElevatedButton(
                                                      child: Text('CHỌN HÃNG'),
                                                      onPressed: () =>
                                                          showMaterialRadioPicker<
                                                              Brand>(
                                                        context: context,
                                                        title:
                                                            'CHỌN HÃNG SẢN XUẤT',
                                                        items: getBrandByMajor(
                                                            selectedMajor.code),
                                                        selectedItem:
                                                            selectedBrand,
                                                        onChanged: (value) =>
                                                            setState(() =>
                                                                selectedBrand =
                                                                    value),
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      height: 50,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20, top: 5),
                                      child: Text(
                                        'Vấn đề gặp phải: ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 220,
                                              margin: EdgeInsets.only(left: 30),
                                              child: (selectedProblem.code !=
                                                      "none")
                                                  ? Text(selectedProblem.name,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                  : Text("< Chưa có vấn đề >",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              alignment: Alignment.centerRight,
                                              child: (selectedMajor.code !=
                                                      "none")
                                                  ? ElevatedButton(
                                                      child:
                                                          Text('CHỌN VẤN ĐỀ'),
                                                      onPressed: () =>
                                                          showMaterialRadioPicker<
                                                              Problem>(
                                                        context: context,
                                                        title:
                                                            'CHỌN VẤN ĐỀ BẠN GẶP PHẢI',
                                                        items:
                                                            getProblemsByMajor(
                                                                selectedMajor
                                                                    .code),
                                                        selectedItem:
                                                            selectedProblem,
                                                        onChanged: (value) =>
                                                            setState(() =>
                                                                selectedProblem =
                                                                    value),
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      height: 50,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        'Mô tả thêm: ',
                                        style: TextStyle(
                                            fontSize: 20,
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
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[800]),
                                          hintText: "Mô tả cụ thể",
                                          fillColor: Colors.white70,
                                          contentPadding:
                                              EdgeInsets.only(left: 15),
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
                                              'MỜI BẠN XÁC NHẬN THÔNG TIN',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: kSecondaryColor,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Text(
                                            'Bạn vui lòng đợi bấm "XÁC NHẬN" để theo dõi hành trình của thợ'),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top: 0),
                                          child: Text("Thông tin yêu cầu",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, left: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Text('ĐỒ CẦN SỬA: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                              child: Text(selectedMajor.name,
                                                  style:
                                                      TextStyle(fontSize: 14)))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Text('HÃNG SẢN XUẤT: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                              child: Text(selectedBrand.name,
                                                  style:
                                                      TextStyle(fontSize: 14)))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Text('VẤN ĐỀ GẶP PHẢI: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                              child: Text(selectedProblem.name,
                                                  style:
                                                      TextStyle(fontSize: 14)))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Text('MÔ TẢ CHI TIẾT: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            width: 230,
                                            margin: EdgeInsets.only(right: 10),
                                            child: (_currentProlemnState != '')
                                                ? Text('$_currentProlemnState',
                                                    style:
                                                        TextStyle(fontSize: 14))
                                                : Text(
                                                    '< Không có mô tả chi tiết >',
                                                    style: TextStyle(
                                                        fontSize: 14)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Text('ĐỊA CHỈ: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            width: 230,
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text(
                                                'Chung cư Sky9, Liên Phường, Phú Hữu, TP.Thủ Đức, TP.HCM.',
                                                style: TextStyle(fontSize: 14)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 0, left: 20),
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
                                                    padding: EdgeInsets.all(5),
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
                                              '< Không có hình ảnh minh họa >',
                                              style: TextStyle(fontSize: 14)))
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
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
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
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () async {},
                                    icon: Icon(Icons.video_camera_front)),
                                Text('Quay video đính kèm'),
                              ],
                            ),
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
                      colors: (selectedMajor.code != "none" &&
                              selectedBrand.code != "none" &&
                              selectedProblem.code != "none")
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
                      if (selectedMajor.code != "none" &&
                          selectedBrand.code != "none" &&
                          selectedProblem.code != "none") {
                        setState(() {
                          _currentProlemnState =
                              _currentProlemnController!.text;
                          _stepIndex = 1;
                        });
                      }
                    },
                    child: Text('TIẾP TỤC'),
                  ),
                )
              : Row(
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
                        child: Text('QUAY LẠI'),
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
                          ],
                          tileMode: TileMode
                              .repeated, // repeats the gradient over the canvas
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            Get.toNamed("/map");
                          });
                        },
                        child: Text('XÁC NHẬN'),
                      ),
                    )
                  ],
                )
        ]),
      ),
    );
  }
}
