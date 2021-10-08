import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/Explore/widgets/major-card.dart';
import 'package:i_repair/Views/Screens/Client/Explore/widgets/recommended-card.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Stack(children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
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
                      child: Icon(Icons.explore, size: 50),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Khám phá',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            bottom: -10,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200)),
                color: kBackgroundColor,
              ),
              width: size.width,
              height: 35,
              child: SizedBox(
                height: 10,
              ),
            ),
          )
        ]),
        SizedBox(height: 15),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Lĩnh Vực Nổi Bật',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 10, top: 10),
                    child: InkWell(
                      onTap: () => {},
                      child: Text(
                        'Xem thêm >>',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MajorCard(),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Đánh Giá Cao',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 10, top: 10),
                    child: InkWell(
                      onTap: () => {},
                      child: Text(
                        'Xem thêm >>',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 250,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        RecommendedCard(
                          image: "assets/images/plumber-banner.png",
                          service: "Lắp đặt đường ống nước trong nhà",
                          company: "Công ty ống nước Châu Thành",
                          stars: 5.0,
                          distance: 3.0,
                        ),
                        RecommendedCard(
                          image: "assets/images/gas-banner.png",
                          service: "Thay ống dẫn gas",
                          company: "Công ty gas Long Châu",
                          stars: 4.8,
                          distance: 0.7,
                        ),
                        RecommendedCard(
                          image: "assets/images/plumber-banner.png",
                          service: "Lắp đặt đường ống nước trong nhà",
                          company: "Công ty ống nước Châu Thành",
                          stars: 5.0,
                          distance: 3.0,
                        ),
                        RecommendedCard(
                          image: "assets/images/gas-banner.png",
                          service: "Thay ống dẫn gas",
                          company: "Công ty gas Long Châu",
                          stars: 4.8,
                          distance: 0.7,
                        ),
                        RecommendedCard(
                          image: "assets/images/plumber-banner.png",
                          service: "Lắp đặt đường ống nước trong nhà",
                          company: "Công ty ống nước Châu Thành",
                          stars: 5.0,
                          distance: 3.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
