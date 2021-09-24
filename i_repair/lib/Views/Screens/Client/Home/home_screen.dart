import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/problem-slide-show.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/recommended-card.dart';
import 'package:i_repair/Views/common/card/icon-card.dart';
import 'package:i_repair/Views/common/searchbar/search-bar.dart';
import 'package:i_repair/views/Screens/Client/Explore/widgets/major-card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              height: 1000,
              child: ListView(
                children: [
                  MajorCard(),
                  SizedBox(height: 10),
                  ProblemSlideShow(),
                  SizedBox(height: 10),
                  Card(
                    elevation: 5,
                    color: kSecondaryLightColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconCard(
                                  number: 500,
                                  icon: 'assets/images/money.png',
                                  unit: 'USD',
                                  color: kPrimaryColor,
                                ),
                                IconCard(
                                  number: 200,
                                  icon: 'assets/images/hand-gesture.png',
                                  unit: 'RP',
                                  color: kPrimaryColor,
                                ),
                              ],
                            )),
                        SearchBar(searchController: _searchController),
                        Card(
                          elevation: 5,
                          color: kSecondaryLightColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          margin: EdgeInsets.only(
                              left: 20, top: 0, right: 20, bottom: 25),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 10, right: 20, bottom: 10),
                            child: InkWell(
                              onTap: () => {},
                              child: Center(
                                child: Column(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 8, color: kPrimaryColor),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(
                                        CupertinoIcons.add_circled,
                                        size: 95,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    Text(
                                      "Tạo Yêu Cầu",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Card(
                    color: kSecondaryLightColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(12),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Đánh giá cao",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(12),
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Xem thêm >>",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
