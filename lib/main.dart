import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:veggies_app/screens/home_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import 'screens/single_product_screen.dart';
import './helpers/auth.dart';
import './ui/colors.dart';
import './screens/profile_screen.dart';
import './screens/search_screen.dart';
import './screens/cart_screen.dart';
import './providers/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Auth auth = Auth();
  Widget currentPage = const AuthScreen();
  String? token;
  Future<void> getToken() async {
    token = (await auth.getToken())!;
  }

  pageSetter() {
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
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColor.primaryColor,
            primarySwatch: AppColor.primarySwatch),
        home: const HomeScreen(),
        routes: {
          '/homescreen': (context) => const HomeScreen(),
          '/singleproductscreen': (context) => const SingleProductScreen(),
          '/profile-screen': (context) => const ProfileScreen(),
          '/search-screen': (context) => const SearchScreen(),
          '/cart-screen': (context) => const CartScreen(),
        },
      ),
    );
  }
}
