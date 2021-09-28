import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Welcome/Signup/signup_screen.dart';
import 'package:provider/provider.dart';
import 'Services/auth/auth.dart';
import 'Views/Screens/Client/CreateBooking/create-booking-screen.dart';
import 'Views/Screens/Client/MyBooking/booking.dart';
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
    
    final _init = Firebase.initializeApp();
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(home: ErrorWidget());
          } else if (snapshot.hasData) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<AuthService>.value(value: AuthService()),
                StreamProvider.value(
                    value: AuthService().user, initialData: null),
              ],
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'iRepair',
                theme: ThemeData(
                    primaryColor: kPrimaryColor,
                    scaffoldBackgroundColor: kBackgroundColor,
                    fontFamily: 'Oswald'),
                initialRoute: '/',
                routes: {
                  '/': (context) => LoginPage(),
                  '/signup_screen': (context) => SignUpPage(),
                  '/client_app': (context) => App(),
                  '/my_booking': (context) => BookingScreen(),
                  '/create_booking': (context) => CreateBookingScreen(),
                },
              ),
            );
          } else {
            return MaterialApp(home: Loading());
          }
        });
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Icon(Icons.error), Text("Có điều gì đó không ổn !")],
        ),
      ),
    );
  }
}
