import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Services/api.services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc with ChangeNotifier {
  UserProfile? currentUser;
  UserBloc() {
    getCurrentUser();
  }
  getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUserString = prefs.getString('currentUser') ?? null;
    String id = userFromJson(currentUserString!).id;
    currentUser = await APIServices.getUserProfile(id);
    notifyListeners();
  }

  setCurrentUserProfile(String field, String value) async {
    UserProfile editedUser = currentUser!;
    if (field == "FULLNAME") {
      editedUser.fullName = value;
    } else if (field == "PHONE_NUMBER") {
      editedUser.phoneNumber = value;
    }
    currentUser = await APIServices.updateProfileUser(editedUser);
    notifyListeners();
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('currentUser');
  }
}
