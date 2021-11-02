import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:i_repair/Models/Tips/tip.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseServices {
  static Future<List<Tip>?> fetchTip() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('tips').get();
    if (querySnapshot.docs.isNotEmpty) {
      var docs =
          querySnapshot.docs.map((doc) => json.encode(doc.data())).toList();
      return tipFromJson(docs.toString());
    } else {
      throw Exception('Document does not exist on the database');
    }
  }

  static Future<String> uploadPic(
      File file, String userId) async {
    //Get the file from the image picker and store it
    //Create a reference to the location you want to upload to in firebase
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("avatars/")
        .child("${userId}/");

    //Upload the file to firebase
    TaskSnapshot taskSnapshot = await reference.putFile(file);

    // Waits till the file is uploaded then stores the download url
    return taskSnapshot.ref.getDownloadURL();
    //returns the download url
  }
}
