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
    setLoading(true);
    final prefs = await SharedPreferences.getInstance();
    final currentUserString = prefs.getString('currentUser') ?? null;
    if (currentUserString != null && !currentUserString.isEmpty) {
      String id = userFromJson(currentUserString).id;
      this.currentUser = await APIServices.getUserProfile(id);
    } else {
      currentUser = null;
    }
    setLoading(false);
    notifyListeners();
  }

  getCompanyOfUser() async {
    setLoading(true);
    if (this.currentUser != null) {
      userCompany =
          await APIServices.getCompanyById(this.currentUser!.companyId);
    }
    if (userCompany != null) setLoading(false);
    notifyListeners();
  }

  logout() async {
    setLoading(true);
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('currentUser');
    setLoading(false);
  }

  setLoading(value) {
    isLoading = value;
  }
}
