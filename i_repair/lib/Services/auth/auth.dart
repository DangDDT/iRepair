import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

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

  Future logout() async {
    await _firebaseAuth.signOut();
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
