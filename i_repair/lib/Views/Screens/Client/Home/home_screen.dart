import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/problem-slide-show.dart';
import 'package:i_repair/Views/Screens/Client/Home/widgets/recommended-card.dart';
import 'package:i_repair/Views/common/card/icon-card.dart';
import 'package:i_repair/Views/common/searchbar/search-bar.dart';

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
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              height: 500,
              child: ListView(
                children: [
                  // BannerSlideShow(),
                  SizedBox(height: 10),
                  ProblemSlideShow(),
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconCard(
                            number: 500,
                            icon: 'assets/images/money.png',
                            unit: 'USD',
                            color: kPrimaryColor.withOpacity(0.8),
                          ),
                          IconCard(
                            number: 200,
                            icon: 'assets/images/hand-gesture.png',
                            unit: 'RP',
                            color: kPrimaryColor.withOpacity(0.8),
                          ),
                        ],
                      )),
                  SearchBar(searchController: _searchController),
                  Container(
                    height: 500,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber[100]),
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
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                        Column(
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
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
