import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUserData;

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

  getUserData() async {
    UserModel localUserData;

    DocumentSnapshot<Map<String, dynamic>> usersData = await FirebaseFirestore
        .instance
        .collection('usersdata')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    localUserData = UserModel(
        userName: usersData.get('username'),
        userImage: usersData.get('userimage'),
        userEmail: usersData.get('useremail'),
        userId: usersData.get('userid'));

    currentUserData = localUserData;
    notifyListeners();
  }

  UserModel? get getCurrentUserData {
    return currentUserData;
  }
}
