import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Screens/Client/HistoryBooking/history-booking.dart';
import 'package:i_repair/Screens/Client/Home/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart.';
import 'common/appbar/common-appbar.dart';
// import 'common/placeholder-widget.dart';

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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          key: null,
          appBar: AppBar(),
          title: 'Current Loction',
          content: 'Sky 9, Liên Phường, Phú Hữu, Thủ Đức, TPHCM',
          haveBackSpace: false),
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          HistoryBookingScreen(),
          Text(
            'Services',
            style: optionStyle,
          ),
          Text(
            'Profile',
            style: optionStyle,
          ),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
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
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: CupertinoColors.activeOrange.withOpacity(0.8),
              color: Colors.black,
              tabs: [
                GButton(
                  icon: CupertinoIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: CupertinoIcons.bookmark,
                  text: 'My Booking',
                ),
                GButton(
                  icon: Icons.explore,
                  text: 'Services',
                ),
                GButton(
                  icon: CupertinoIcons.profile_circled,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (page) {
                if (page != _selectedIndex) {
                  setState(() {
                    _selectedIndex = page;
                    _pageController.animateToPage(page,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic);
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
