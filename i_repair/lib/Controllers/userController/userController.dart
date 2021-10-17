import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Services/api.services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc with ChangeNotifier {
  CurrentUser? currentUser;
  UserBloc() {
    getCurrentUser();
  }
  getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUserString = prefs.getString('currentUser') ?? null;
    currentUser = userFromJson(currentUserString!);
    notifyListeners();
  }

  setCurrentUserProfile(String field, String value) async {
    CurrentUser editedUser = currentUser!;
    if (field == "FULLNAME") {
      editedUser.name = value;
    } else if (field == "PHONE_NUMBER") {
      editedUser.phoneNumber = value;
    }
    currentUser = await APIServices.updateProfileUser(editedUser);
    final prefs = await SharedPreferences.getInstance();
    String currentUserString = jsonEncode(editedUser);
    prefs.setString('currentUser', currentUserString);
    notifyListeners();
  }
}
