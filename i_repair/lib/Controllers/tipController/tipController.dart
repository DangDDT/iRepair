import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Tips/tip.dart';
import 'package:i_repair/Services/firebaseService/firebase.service.dart';

class TipBloc with ChangeNotifier {
  List<Tip>? _tipList;
  UnmodifiableListView<Tip> get tipList => UnmodifiableListView(_tipList!);
  TipBloc() {}
  getTipList() async {
    this._tipList = await FirebaseServices.fetchTip();
    notifyListeners();
  }
}
