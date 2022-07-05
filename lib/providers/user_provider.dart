import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier {
  void addUserData(User? currentUser) async {
    await FirebaseFirestore.instance
        .collection('usersdata')
        .doc(currentUser!.uid)
        .set({
      'username': currentUser.displayName,
      'useremail': currentUser.email,
      'userimage': currentUser.photoURL,
      'userid': currentUser.uid,
    });
    notifyListeners();
  }
}
