import 'package:flutter/material.dart';
import 'package:i_repair/Screens/Client/Home/home_screen.dart';
import 'package:i_repair/Screens/Client/Setting/setting.dart';

import 'common/common-appbar.dart';
import 'common/placeholder-widget.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  final List<Widget> _children = <Widget>[
    HomeScreen(),
    WeatherForecastWidget(),
    PlaceholderWidget(Colors.white, "Location Page"),
    PlaceholderWidget(Colors.white, "Notification Page"),
    PlaceholderWidget(Colors.white, "Setting Page"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(key: null, appBar: AppBar(), title: 'Hi, DangDDT'),
      body: _children.elementAt(_currentIndex),
      // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        iconSize: 30,
        elevation: 8.0,
        onTap: _onTabTapped, // new
        currentIndex: _currentIndex,
        backgroundColor: Color(0xffEB5E28),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black87, // new
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.local_activity),
              icon: Icon(
                Icons.home,
              ),
              label: _currentIndex == 0 ? 'Activity' : 'Home',
              backgroundColor: Color(0xffEB5E28)),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Message',
            backgroundColor: Color(0xffEB5E28),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Location',
            backgroundColor: Color(0xffEB5E28),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
            backgroundColor: Color(0xffEB5E28),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
              backgroundColor: Color(0xffEB5E28)),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
