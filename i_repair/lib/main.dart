import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/BookService/map/widgets/cancel_page.dart';
import 'package:i_repair/Views/Screens/Welcome/ForgotPassword/forgotPassword-screen.dart';
import 'package:i_repair/Views/Screens/Welcome/SignUp/signup-screen.dart';
import 'package:i_repair/Views/common/repairman_rating/rating.dart';
import 'package:i_repair/views/Screens/Client/HistoryBooking/history-booking.dart';
import 'Views/Screens/Client/BookService/book-service.dart';
import 'Views/Screens/Client/BookService/map/full_map.dart';
import 'Views/Screens/Client/BookService/map/widgets/chat_with_repairman.dart';
import 'Views/Screens/Client/Chat/chat.dart';
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
        '/map': (context) => FullMapPage(),
        '/rating': (context) => RatingPage(),
        '/chat2': (context) => ChatPage2(),
        '/chat': (context) => ChatPage(),
        '/cancel_page': (context) => CancelRequestPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/signup': (context) => SignUpPage(),
        '/client_app': (context) => App(),
        '/my_booking': (context) => HistoryBookingScreen(),
        '/book_service': (context) => BookServiceScreen(),
      },
    );
  }
}
