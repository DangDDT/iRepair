import 'package:flutter/material.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
// import 'package:i_repair/Screens/Welcome/welcome_screen.dart';
import 'package:i_repair/constaints.dart';
import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iRepair',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryLightColor,
          fontFamily: 'SpaceMono'),
      home: App(),
    );
  }
}
