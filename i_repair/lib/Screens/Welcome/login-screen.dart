import 'package:flutter/material.dart';
import 'package:i_repair/Screens/Welcome/components/login-form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final background = Stack(children: [
      Positioned(
          top: -20,
          left: 0,
          child: Image.asset('assets/images/bubble-decor.png')),
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
        radius: 50,
        child: Image.asset('assets/images/logo.png'),
      ),
    );

    final loginForm = LoginForm();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        background,
        Center(
            child: Image.asset("assets/images/worker-picture.png",
                width: size.width)),
        Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 150.0),
            children: <Widget>[logo, SizedBox(height: 45.0), loginForm],
          ),
        ),
      ]),
    );
  }
}
