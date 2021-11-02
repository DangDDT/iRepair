import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Tips/tip.dart';
import 'package:i_repair/Services/firebaseService/firebase.service.dart';

class TipBloc with ChangeNotifier {
  bool isLoading = true;
  List<Tip>? _tipList = List<Tip>.empty();
  UnmodifiableListView<Tip>? get tipList => UnmodifiableListView(_tipList!);
  TipBloc() {}
  getTipList() async {
    setLoading(true);
    this._tipList = await FirebaseServices.fetchTip();
    setLoading(false);
    notifyListeners();
  }

  void setLoading(val) {
    this.isLoading = val;
  }
}
