import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

// Create a Form widget.
class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);
  @override
  ForgotPasswordFormState createState() {
    return ForgotPasswordFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ForgotPasswordFormState extends State<ForgotPasswordForm> {
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
              hintText: 'Email',
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
                    if (_formKey.currentState!.validate()) {
                      // if (loginAction(
                      //     _emailController.text, _passwordController.text)) {
                      Get.offNamed('/');
                    }
                  },
                  child: Text('Tìm mật khẩu', style: TextStyle(fontSize: 16)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  )),
            ],
          ),
          Center(
            child: TextButton(
              child: Text(
                'Quay lại',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () => {Get.back()},
            ),
          ),
        ],
      ),
    );
  }
}
