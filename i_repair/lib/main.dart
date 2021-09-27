import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/views/Screens/Client/HistoryBooking/history-booking.dart';
import 'Views/Screens/app.dart';
import 'views/Screens/Welcome/Login/login-screen.dart';
// import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iRepair',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Oswald'),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/client_app': (context) => App(),
        '/my_booking': (context) => HistoryBookingScreen(),
      },
    );
  }
}
