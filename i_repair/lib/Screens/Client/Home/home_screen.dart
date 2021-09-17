import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:i_repair/common/icon-card.dart';
import 'package:i_repair/common/major-card.dart';
import 'package:i_repair/common/search-bar.dart';
import 'package:i_repair/constaints.dart';

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
              height: 800,
              child: ListView(
                children: [
                  MajorCard(),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    margin:
                        EdgeInsets.only(top: 0, bottom: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30)),
                        color: Colors.amber[200]),
                    child: ImageSlideshow(
                      /// Width of the [ImageSlideshow].
                      width: double.infinity,

                      /// Height of the [ImageSlideshow].
                      height: 100,

                      /// The page to show when first creating the [ImageSlideshow].
                      initialPage: 0,

                      /// The color to paint the indicator.
                      indicatorColor: Colors.black87,

                      /// The color to paint behind th indicator.
                      indicatorBackgroundColor: Colors.grey,

                      /// The widgets to display in the [ImageSlideshow].
                      /// Add the sample image file into the images folder
                      children: [
                        // Image.asset(
                        //   'assets/images/laptop-banner.png',
                        //   fit: BoxFit.fitWidth,
                        // ),
                        Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => {},
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Card(
                                      color: Colors.amber,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      semanticContainer: true,
                                      elevation: 5,
                                      child: Container(
                                        width: 230,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                  'Xe máy bạn có đang bị hỏng?',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              margin: EdgeInsets.only(top: 25),
                                              child: Text(
                                                  'Nhấn để xem chi tiết >>',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      'assets/images/xe-hong.jpg',
                                      width: 130,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],

                      /// Called whenever the page in the center of the viewport changes.
                      onPageChanged: (value) {},

                      /// Auto scroll interval.
                      // isLoop: true,

                      /// Do not auto scroll with null or 0.
                      autoPlayInterval: 3000,
                    ),
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
