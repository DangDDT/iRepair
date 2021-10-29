import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Services/auth/auth.dart';
import 'package:provider/provider.dart';

// Create a Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          (loginProvider.errorMessage != '')
              ? Container(
                  width: size.width,
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  child: Text(loginProvider.errorMessage,
                      style: TextStyle(color: kErrorColor)))
              : SizedBox(height: 0),
          Container(
            alignment: Alignment.center,
            child: SignInButton(
              Buttons.Google,
              elevation: 5,
              shape: OutlineInputBorder(borderSide: BorderSide.none),
              text: "Sign in with Google",
              onPressed: () async {
                await loginProvider.signInWithGoogle(context: context);
                final user = Provider.of<User?>(context, listen: false);
                if (user != null) {
                  Get.offAndToNamed('/client_app');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
