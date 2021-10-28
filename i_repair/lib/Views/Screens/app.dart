import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart.';
import 'package:i_repair/Controllers/userController/userController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Views/Screens/Client/Explore/explore.dart';
import 'package:provider/provider.dart';
import 'Client/Home/home_screen.dart';
import 'Client/MyBooking/booking.dart';
import 'Client/Profile/profile.dart';

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
    _pageController.addListener(() {
      if (_pageController.page!.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);
    UserProfile? currentUser = userBloc.currentUser;
    return Scaffold(
      // appBar: BaseAppBar(
      //     key: null,
      //     appBar: AppBar(),
      //     title: 'Xin chào, Đỗ Dương Tâm Đăng',
      //     content: 'Sky 9, Liên Phường, Phú Hữu, Thủ Đức, TPHCM',
      //     haveBackSpace: false),
      body: (currentUser == null)
          ? Padding(
              padding: EdgeInsets.only(left: 100, right: 100, top: 300),
              child: Column(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: kSecondaryColor,
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 300,
                      child:
                          Text("Đang tải dữ liệu, đợi xíu nhé 'Thượng đế'...")),
                ],
              ))
          : PageView(
              controller: _pageController,
              children: [
                HomeScreen(user: currentUser),
                BookingScreen(),
                ProfileScreen(user: currentUser)
              ],
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
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: kSecondaryLightColor,
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
