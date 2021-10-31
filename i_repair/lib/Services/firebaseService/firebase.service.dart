import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_repair/Models/Tips/tip.dart';

class FirebaseServices {
  static Future<List<Tip>?> fetchTip() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('tips').get();
    if (querySnapshot.docs.isNotEmpty) {
      var docs =
          querySnapshot.docs.map((doc) => json.encode(doc.data())).toList();
      print(tipFromJson(docs.toString()));
      return tipFromJson(docs.toString());
    } else {
      throw Exception('Document does not exist on the database');
    }
  }
}
