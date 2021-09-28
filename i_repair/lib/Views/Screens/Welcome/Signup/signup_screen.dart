import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Services/auth/auth.dart';
import 'package:i_repair/Views/Screens/Welcome/Signup/widgets/signup-form.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

    final signUpForm = SignUpForm();
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
              signUpForm,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: MaterialButton(
                      child: Text(
                        'Bạn đã có tài khoản ?',
                        style: TextStyle(color: Colors.black54),
                      ),
                      onPressed: () {
                        Provider.of<AuthService>(context, listen: false)
                            .setMessage('');
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
