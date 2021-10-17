import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/placeController/placeController.dart';
import 'package:i_repair/Controllers/userController/userController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/CreateBooking/widgets/success-screen.dart';
import 'package:provider/provider.dart';
import 'Services/auth/auth.dart';
import 'Views/Screens/Client/CreateBooking/create-booking-screen.dart';
import 'Views/Screens/Client/MyBooking/booking.dart';
import 'Views/Screens/app.dart';
import 'views/Screens/Welcome/Login/login-screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'app.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();
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
                ChangeNotifierProvider(create: (context) => PlaceBloc()),
                ChangeNotifierProvider(create: (context) => UserBloc()),
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
                  '/client_app': (context) => App(),
                  '/my_booking': (context) => BookingScreen(),
                  '/create_booking': (context) => CreateBookingScreen(),
                  '/success_screen': (context) => SuccessScreen()
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
