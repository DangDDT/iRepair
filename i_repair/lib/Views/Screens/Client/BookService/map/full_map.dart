import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/BookService/map/widgets/comment.dart';
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
        title: "Theo dõi thợ",
      ),
      body: Stack(children: [
        MapboxMap(
          onStyleLoadedCallback: () {},
          accessToken:
              "sk.eyJ1IjoidGFtZGFuZ3ZuIiwiYSI6ImNrdXZmZnJ4OTFtczgydWxubTJvcGlqeTUifQ.zu6v9bXd6Np6zGnj-S48-g",
          onMapCreated: _onMapCreated,
          scrollGesturesEnabled: false,
          initialCameraPosition: const CameraPosition(
              target: LatLng(10.80457, 106.79079), zoom: 15.0),
          styleString:
              "https://tiles.goong.io/assets/goong_map_web.json?api_key=vRN7UdpxfAGDGSf2Np3GT4L99itmOuaZ6dfncWt8",
        ),
        Positioned(
          top: 210,
          left: 120,
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
          top: 300,
          left: 190,
          child: Icon(
            CupertinoIcons.location_solid,
            color: Colors.red,
          ),
        ),
        Positioned(
          bottom: 60,
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
                                Text("Tuyết đông nhiều trên ngăn đông",
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
                            Row(
                              children: [
                                Text('Thợ: '),
                                Text("Phạm Hữu Nghĩa",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                          "https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/145490152_1645861872468232_2404576525271328519_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=-KKRXEcThkEAX-VQeMP&_nc_ht=scontent.fsgn5-8.fna&oh=5dfe93870e948990400b19eafa9ebd6e&oe=6183DEBC",
                                          height: 70,
                                          width: 70),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: kSecondaryColor,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: kSecondaryColor,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: kSecondaryColor,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: kSecondaryColor,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Phản hồi gần đây của khách hàng:  '),
                              ],
                            ),
                            Container(
                              width: 300,
                              height: 120,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CommentWidget(
                                      time: "12:46:00 26/09/2021",
                                      customer: "Dương Gia Mẫn",
                                      sameStar: 32,
                                      stars: 3,
                                      comment:
                                          "Thợ dễ thương, sửa nhanh, phục vụ rất tốt"),
                                  CommentWidget(
                                      time: "13:35:00 27/09/2021",
                                      customer: "Phạm Ngọc Minh Hiếu",
                                      sameStar: 32,
                                      stars: 3,
                                      comment:
                                          "Thợ number 1, không chê vào đâu được"),
                                  CommentWidget(
                                      time: "17:10:00 28/09/2021",
                                      customer: "Trần Gia Hảo",
                                      sameStar: 32,
                                      stars: 3,
                                      comment:
                                          "Tuy đến hơi lâu nhưng ảnh sửa rất nhanh, rất chuyên nghiệp")
                                ],
                              ),
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Text('Phí dự kiến:  '),
                                Text("200.000 - 300.000 VNĐ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Hình ảnh minh họa:  '),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text("<Không có hình ảnh minh họa>",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(
                              height: 10,
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
                  });
            },
            child: Container(
              height: 170,
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
                                child: Image.network(
                                    "https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/145490152_1645861872468232_2404576525271328519_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=-KKRXEcThkEAX-VQeMP&_nc_ht=scontent.fsgn5-8.fna&oh=5dfe93870e948990400b19eafa9ebd6e&oe=6183DEBC",
                                    height: 70,
                                    width: 70),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: kSecondaryColor,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: kSecondaryColor,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: kSecondaryColor,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: kSecondaryColor,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                ],
                              )
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
                                    child: Text('THỢ: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kSecondaryLightColor))),
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text('PHẠM HỮU NGHĨA',
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
                                    child: Text('0123456789',
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
                                    child: Text('CHUYÊN MÔN: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: kSecondaryLightColor))),
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text('Kỹ sư điện',
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
                            Container(
                                margin: EdgeInsets.only(left: 20, top: 5),
                                child: Text('< Nhấn để xem chi tiết > ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color: kTextColor)))
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
                                              'Bạn muốn gọi đến Phạm Hữu Nghĩa ?'),
                                          content: Text(
                                              'Nhấn "Gọi" để gọi đến số 0123456789'),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text('Hủy')),
                                            TextButton(
                                              onPressed: () {
                                                launch("tel://0123456789");
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
                children: [
                  Container(
                    child: MaterialButton(
                      elevation: 8,
                      color: kSecondaryLightColor,
                      onPressed: () => {Get.offAndToNamed("/client_app")},
                      child: Text("QUAY LẠI TRANG CHỦ"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    child: MaterialButton(
                      elevation: 8,
                      color: Colors.red,
                      onPressed: () => {Get.toNamed('/cancel_page')},
                      child: Text("HỦY YÊU CẦU"),
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
