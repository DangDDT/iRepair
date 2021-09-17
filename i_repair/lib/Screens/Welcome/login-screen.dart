import 'package:flutter/material.dart';
import 'package:i_repair/Screens/Welcome/components/login-form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final background = Stack(children: [
      // Positioned(
      //     top: 0,
      //     left: 0,
      //     child: Image.asset(
      //       'assets/images/bubble-decor.png',
      //     )),
      // Align(
      //     alignment: Alignment(-0.2, 0.15),
      //     child: Image.asset('assets/images/rectangle-light.png')),
      // Align(
      //     alignment: Alignment.center,
      //     child: Image.asset('assets/images/rectangle-bold.png'))
    ]);
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60,
        child: Image.asset('assets/images/worker-picture.png'),
      ),
    );

    final loginForm = LoginForm();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        background,
        Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            children: <Widget>[logo, SizedBox(height: 45.0), loginForm],
          ),
        ),
      ]),
    );
  }
}
