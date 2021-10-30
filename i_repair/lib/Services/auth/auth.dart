import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Services/api.services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        user = userCredential.user;
        String initialtoken = await user!.getIdToken(true);
        final token = <String>[];
        while (initialtoken.length > 0) {
          int initLength =
              (initialtoken.length >= 500 ? 500 : initialtoken.length);
          print(initialtoken.substring(0, initLength));
          token.add(initialtoken.substring(0, initLength));
          int endLength = initialtoken.length;
          initialtoken = initialtoken.substring(initLength, endLength);
        }
        if (!token.isEmpty) {
          CurrentUser currentUser = await APIServices.createUser(token)
              .whenComplete(() => APIServices.cleanCache());
          final prefs = await SharedPreferences.getInstance();
          String currentUserString = jsonEncode(currentUser);
          print(currentUserString);
          prefs.setString('currentUser', currentUserString);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          setMessage(e.message);
        } else if (e.code == 'invalid-credential') {
          setMessage(e.message);
        }
      }
    }

    return user;
  }

  Future logout({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {}
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User?> get user => _firebaseAuth.idTokenChanges();
}
