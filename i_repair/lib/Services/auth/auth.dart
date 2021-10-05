import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future signIn({required String email, required String password}) async {
    try {
      setLoading(true);
      UserCredential userResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userResult.user!;
      setLoading(false);
      setMessage('');
      return user;
    } on SocketException {
      setLoading(false);
      setMessage('Không có mạng, vui lòng kết nối mạng.');
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'user-not-found') {
        setMessage('Email của bạn không tồn tại');
      } else if (e.code == 'wrong-password') {
        setMessage('Mật khẩu không đúng');
      }
    }
    notifyListeners();
  }

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
        // String token = await user!.getIdToken(true);
        // while (token.length > 0) {
        //   int initLength = (token.length >= 500 ? 500 : token.length);
        //   print(token.substring(0, initLength));
        //   int endLength = token.length;
        //   token = token.substring(initLength, endLength);
        // }
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

  Future signUp({required String email, required String password}) async {
    FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);

    try {
      setLoading(true);
      await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);
      setLoading(false);
      setMessage('');
      app.delete();
      return true;
    } on SocketException {
      setLoading(false);
      setMessage('Không có mạng, vui lòng kết nối mạng.');
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'weak-password') {
        setMessage('Vui lòng đổi mật khẩu bảo mật tốt hơn.');
      } else if (e.code == 'email-already-in-use') {
        setMessage('Email đã có người sử dụng.');
      }
      app.delete();
      return false;
    }
    app.delete();
    notifyListeners();
    return false;
  }

  Future logout({required BuildContext context}) async {
    final provider = _firebaseAuth.currentUser!.providerData.first.providerId;
    switch (provider) {
      case 'password':
        await _firebaseAuth.signOut();
        break;
      case 'google.com':
        {
          final GoogleSignIn googleSignIn = GoogleSignIn();

          try {
            if (!kIsWeb) {
              await googleSignIn.signOut();
            }
            await FirebaseAuth.instance.signOut();
          } catch (e) {}
        }
    }
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
