import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:i_repair/Views/Screens/app.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login Form';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const LoginForm(),
      ),
    );
  }
}

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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Hardcode to test UI
  loginAction(email, password) {
    if (email == "irepair_test@gmail.com" && password == "Qwerty123") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            // initialValue: _emailController.text,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            //   return null;
            // },
            decoration: InputDecoration(
              hintText: 'Enter your email...',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: _passwordController,
            autofocus: false,
            // initialValue: _passwordController.text,
            obscureText: true,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            //   return null;
            // },
            decoration: InputDecoration(
              hintText: 'Enter your password...',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // debugPrint(_emailController.text);
                    // debugPrint(_passwordController.text);
                    if (_formKey.currentState!.validate()) {
                      // if (loginAction(
                      //     _emailController.text, _passwordController.text)) {
                      Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 200),
                              reverseDuration: Duration(milliseconds: 200),
                              child: App(),
                              type: PageTransitionType.fade));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     backgroundColor: Colors.green,
                      //     content: Text('Login Successed. Processing Data',
                      //         style: TextStyle(color: Colors.white)),
                      //   ),
                      // );
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         backgroundColor: Colors.red,
                      //         content: Text(
                      //             'Login failed. Email or password invalid',
                      //             style: TextStyle(color: Colors.white))),
                      //   );
                      // }
                    }
                  },
                  child: Text('Sign in'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
