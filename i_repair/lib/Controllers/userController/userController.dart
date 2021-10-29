import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Company/company.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Services/api.services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc with ChangeNotifier {
  bool isLoading = true;
  UserProfile? currentUser;
  Company? userCompany;
  UserBloc() {}
  getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUserString = prefs.getString('currentUser') ?? null;
    if (currentUserString != null && !currentUserString.isEmpty) {
      String id = userFromJson(currentUserString).id;
      this.currentUser = await APIServices.getUserProfile(id);
    } else {
      currentUser = null;
    }
    notifyListeners();
  }

  getCompanyOfUser() async {
    if (this.currentUser != null) {
      userCompany =
          await APIServices.getCompanyById(this.currentUser!.companyId);
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('currentUser');
  }
}
