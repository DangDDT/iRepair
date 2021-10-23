import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart.';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/Explore/explore.dart';
import 'package:i_repair/Views/Screens/Client/HistoryBooking/history-booking.dart';
import 'package:i_repair/Views/Screens/Client/Profile/profile.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:i_repair/views/Screens/Client/Home/home_screen.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page!.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(
      //     key: null,
      //     appBar: AppBar(),
      //     title: 'Xin chào, Phạm Hữu Nghĩa',
      //     content: 'Sky 9, Liên Phường, Phú Hữu, Thủ Đức, TPHCM',
      //     haveBackSpace: false),
      body: PageView(
        controller: _pageController,
        children: [HomeScreen(), HistoryBookingScreen(), ProfileScreen()],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: kTextColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: kBackgroundColor,
              tabBackgroundGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    5, 10), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  kSecondaryLightColor,
                  kBackgroundColor
                ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
              color: Colors.black,
              tabs: [
                GButton(
                  icon: CupertinoIcons.home,
                  text: 'Trang chủ',
                ),
                GButton(
                  icon: CupertinoIcons.book,
                  text: 'Lịch sử',
                ),
                GButton(
                  icon: CupertinoIcons.profile_circled,
                  text: 'Thông tin',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (page) {
                if (page != _selectedIndex) {
                  setState(() {
                    _selectedIndex = page;
                    _pageController.jumpToPage(
                      page,
                    );
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
