import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/app.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'page.dart';

class FullMapPage extends ExamplePage {
  FullMapPage() : super(const Icon(Icons.map), 'Full screen map');

  @override
  Widget build(BuildContext context) {
    return const FullMap();
  }
}

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  MapboxMapController? mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    controller.addSymbol(SymbolOptions(
      geometry: LatLng(10.80457, 106.79079),
    ));
    controller.addLine(
      LineOptions(
        geometry: [
          LatLng(10.80606, 106.78953),
          LatLng(10.80480, 106.79184),
          LatLng(10.80410, 106.79200),
          LatLng(10.80410, 106.79065),
        ],
        lineColor: "#ff0000",
        lineWidth: 5.0,
        lineOpacity: 0.5,
        draggable: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        haveBackSpace: false,
        title: "Chỉ đường đến khách hàng",
      ),
      body: Stack(children: [
        MapboxMap(
          onStyleLoadedCallback: () {},
          accessToken:
              "sk.eyJ1IjoidGFtZGFuZ3ZuIiwiYSI6ImNrdXZmZnJ4OTFtczgydWxubTJvcGlqeTUifQ.zu6v9bXd6Np6zGnj-S48-g",
          onMapCreated: _onMapCreated,
          scrollGesturesEnabled: false,
          initialCameraPosition: const CameraPosition(
              target: LatLng(10.80606, 106.78953), zoom: 15.0),
          styleString:
              "https://tiles.goong.io/assets/goong_map_web.json?api_key=vRN7UdpxfAGDGSf2Np3GT4L99itmOuaZ6dfncWt8",
        ),
        Positioned(
          top: 280,
          left: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/worker-picture.png",
              height: 30,
              width: 50,
            ),
          ),
        ),
        Positioned(
          top: 370,
          left: 250,
          child: Icon(
            CupertinoIcons.location_solid,
            color: Colors.red,
          ),
        ),
        Positioned(
          bottom: 50,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('CHI TIẾT YÊU CẦU',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
              );
            },
            child: Container(
              height: 140,
              padding: EdgeInsets.all(5),
              width: size.width,
              child: Card(
                elevation: 5,
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset("assets/images/avatar.jpg",
                                    height: 70, width: 70),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: Text('KHÁCH HÀNG: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kSecondaryLightColor))),
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text('Đ.D.TÂM ĐĂNG',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kTextColor)))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: Text('SỐ ĐIỆN THOẠI: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kSecondaryLightColor))),
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text('0774839222',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kTextColor)))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: Text('KHOẢNG CÁCH: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kSecondaryLightColor))),
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text('0.3km',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kTextColor)))
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Column(
                            children: [
                              MaterialButton(
                                onPressed: () => {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Bạn muốn gọi đến khách hàng ?'),
                                          content: Text(
                                              'Nhấn "Gọi" để gọi đến số 0774839222'),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text('Hủy')),
                                            TextButton(
                                              onPressed: () {
                                                launch("tel://0774839222");
                                              },
                                              child: Text('Gọi'),
                                            )
                                          ],
                                        );
                                      })
                                },
                                child: Icon(Icons.phone, color: Colors.blue),
                              ),
                              MaterialButton(
                                onPressed: () => {Get.toNamed('/chat2')},
                                child: Icon(Icons.message, color: Colors.blue),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            left: 20,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: MaterialButton(
                      elevation: 8,
                      color: kSecondaryLightColor,
                      onPressed: () => {Get.offAndToNamed("/client_app")},
                      child: Text("TRANG CHỦ"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: MaterialButton(
                      elevation: 8,
                      color: Colors.green,
                      onPressed: () => {Get.toNamed('/rating')},
                      child: Text("ĐÃ SỬA XONG"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: MaterialButton(
                      elevation: 8,
                      color: Colors.red,
                      onPressed: () => {Get.toNamed('/cancel_page')},
                      child: Text("HỦY"),
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
