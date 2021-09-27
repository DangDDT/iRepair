import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'widgets/login-form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: 50,
        child: Image.asset(
          'assets/images/worker-picture.png',
        ),
      ),
    );

    final loginForm = LoginForm();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(children: [
        Positioned(
          top: -20,
          left: -60,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: kPrimaryLightColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          right: -80,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: kPrimaryLightColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            children: <Widget>[
              logo,
              Image.asset(
                'assets/images/logo_letter.png',
                height: 100,
              ),
              SizedBox(height: 45.0),
              loginForm
            ],
          ),
        ),
      ]),
    );
  }
}
