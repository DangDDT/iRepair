import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/views/Screens/Client/Home/widgets/problem-slide-show.dart';
import 'package:i_repair/views/common/card/major-card.dart';
import 'package:i_repair/views/common/searchbar/search-bar.dart';

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
                  MajorCard(),
                  // BannerSlideShow(),
                  ProblemSlideShow(),
                  // Container(
                  //     alignment: Alignment.center,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         IconCard(
                  //           number: 500,
                  //           icon: 'assets/images/money.png',
                  //           unit: 'USD',
                  //           color: kPrimaryColor.withOpacity(0.8),
                  //         ),
                  //         IconCard(
                  //           number: 200,
                  //           icon: 'assets/images/hand-gesture.png',
                  //           unit: 'RP',
                  //           color: kPrimaryColor.withOpacity(0.8),
                  //         ),
                  //       ],
                  //     )),
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
                        Container(
                          height: 200,
                          margin: EdgeInsets.all(10),
                          width: 400,
                          decoration: BoxDecoration(
                              color: CupertinoColors.systemYellow,
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/images/plumber-banner.png',
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 10),
                                height: 25,
                                child: Text("Kiểm tra và thay gas máy lạnh",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 10),
                                height: 25,
                                child: Text("Công ty điện lạnh Thành Phát",
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ),
                              Row(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left: 10),
                                      height: 20,
                                      child: Icon(
                                        CupertinoIcons.star_circle,
                                        color: CupertinoColors.activeOrange,
                                      )),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(left: 10),
                                    height: 20,
                                    child: Text("5/5 stars",
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(right: 10),
                                      height: 20,
                                      child: Text("Cách 3.0km",
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: EdgeInsets.all(10),
                          width: 400,
                          decoration: BoxDecoration(
                              color: CupertinoColors.systemYellow,
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/images/gas-banner.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 10),
                                height: 25,
                                child: Text("Thay ống dẫn gas",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 10),
                                height: 25,
                                child: Text("Công ty gas Long Châu",
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ),
                              Row(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left: 10),
                                      height: 20,
                                      child: Icon(
                                        CupertinoIcons.star_circle,
                                        color: CupertinoColors.activeOrange,
                                      )),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(left: 10),
                                    height: 20,
                                    child: Text("4.8/5 stars",
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(right: 10),
                                      height: 20,
                                      child: Text("Cách 0.7km",
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
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
