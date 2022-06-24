import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:veggies_app/screens/home_screen.dart';
import 'firebase_options.dart';

import './screens/auth_screen.dart';
import './helpers/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Auth auth = Auth();
  Widget currentPage = AuthScreen();
  String? token;
  Future<void> getToken() async {
    token = (await auth.getToken())!;
  }

  pageSetter() {
    print(token);
    if (token != null) {
      setState(() {
        currentPage = const HomeScreen();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getToken();
    pageSetter();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: currentPage,
      routes: {
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}
