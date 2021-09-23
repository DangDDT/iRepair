import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_repair/Views/Screens/Welcome/Login/login-screen.dart';
import 'package:i_repair/Views/Screens/app.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => LoginPage());
    case '/client_app':
      return PageTransition(
          duration: Duration(milliseconds: 200),
          reverseDuration: Duration(milliseconds: 200),
          child: App(),
          type: PageTransitionType.fade);
    default:
      return MaterialPageRoute(builder: (_) => LoginPage());
  }
}
