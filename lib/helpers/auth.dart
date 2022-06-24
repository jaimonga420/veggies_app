import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';

class Auth {
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  final GoogleSignIn signin = GoogleSignIn(scopes: [
    'email',
  ]);

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await signin.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential authCredentials = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        try {
          UserCredential userCredentials =
              await fireAuth.signInWithCredential(authCredentials);

          final fireToken = await fireAuth.currentUser!.getIdToken();
          storeToken(fireToken);
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> storeToken(fireToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', fireToken);
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await signin.signOut();
      fireAuth.signOut();
      await prefs.remove('token');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
