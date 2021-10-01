import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Services/auth/auth.dart';
import 'package:provider/provider.dart';

// Create a Form widget.
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignUpFormState extends State<SignUpForm> {
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
    final signupProvider = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mời bạn nhập email';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Email không đúng dịnh dạng';
              }
              return null;
            },
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
          SizedBox(height: 15.0),
          TextFormField(
            controller: _passwordController,
            autofocus: false,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mời bạn nhập mật khẩu';
              } else if (value.length < 6) {
                return 'Mật khẩu ít nhất có 6 kí tự';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Mật khẩu',
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
          (signupProvider.errorMessage != '')
              ? Container(
                  width: size.width,
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  child: Text(signupProvider.errorMessage,
                      style: TextStyle(color: kErrorColor)))
              : SizedBox(height: 0),
          Container(
            alignment: Alignment.center,
            child: signupProvider.isLoading
                ? CircularProgressIndicator(
                    color: kPrimaryColor,
                  )
                : MaterialButton(
                    onPressed: () async {
                      Provider.of<AuthService>(context, listen: false)
                          .setMessage('');
                      if (_formKey.currentState!.validate()) {
                        bool signUpSuccess = await signupProvider.signUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
                        if (signUpSuccess) {
                          Get.offAllNamed('/');
                        }
                      }
                    },
                    elevation: 5,
                    color: kPrimaryColor,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('Đăng ký', style: TextStyle(fontSize: 16)),
                  ),
          ),
        ],
      ),
    );
  }
}
