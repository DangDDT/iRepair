import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:i_repair/Screens/Client/Home/components/select_card.dart';
import 'package:i_repair/common/icon-card.dart';
import 'package:i_repair/common/search-bar.dart';

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
                  SearchBar(searchController: _searchController),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(5),
                    child: ImageSlideshow(
                      /// Width of the [ImageSlideshow].
                      width: double.infinity,

                      /// Height of the [ImageSlideshow].
                      height: 200,

                      /// The page to show when first creating the [ImageSlideshow].
                      initialPage: 0,

                      /// The color to paint the indicator.
                      indicatorColor: Colors.orange[300],

                      /// The color to paint behind th indicator.
                      indicatorBackgroundColor: Colors.grey,

                      /// The widgets to display in the [ImageSlideshow].
                      /// Add the sample image file into the images folder
                      children: [
                        Image.asset(
                          'assets/images/laptop-banner.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/clean-banner.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/car-banner.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/plumber-banner.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ],

                      /// Called whenever the page in the center of the viewport changes.
                      onPageChanged: (value) {},

                      /// Auto scroll interval.
                      isLoop: true,

                      /// Do not auto scroll with null or 0.
                      autoPlayInterval: 3000,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconCard(
                            number: 500,
                            icon: 'assets/images/money.png',
                            unit: 'USD',
                            color: Color(0xffE63B2E).withOpacity(0.7),
                          ),
                          IconCard(
                            number: 200,
                            icon: 'assets/images/hand-gesture.png',
                            unit: 'RP',
                            color: Color(0xffE63B2E).withOpacity(0.7),
                          ),
                        ],
                      )),
                  Stack(children: [
                    Container(
                      // alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Color(0XffCCC5B9).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(
                          top: 30, bottom: 5, left: 10, right: 10),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 0, right: 0),
                      width: double.infinity,
                      height: 220,
                      child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10,
                          children: List.generate(choices.length, (index) {
                            return Center(
                              child: SelectCard(choice: choices[index]),
                            );
                          })),
                    ),
                    Positioned(
                      top: 5,
                      left: 30,
                      child: Container(
                          height: 40,
                          color: Colors.transparent,
                          child: Text('MAJOR',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
