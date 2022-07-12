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
import './screens/cart_screen.dart';
import './providers/product_provider.dart';
import './screens/products_list_screen.dart';
import './providers/user_provider.dart';
import './providers/cart_provider.dart';
import './providers/wishlist_provider.dart';
import './screens/wishlist_screen.dart';
import './screens/address_screen.dart';
import './screens/add_address_screen.dart';
import './screens/order_summary_screen.dart';
import './providers/checkout_provider.dart';
import './providers/order_provider.dart';
import './screens/my_orders_screen.dart';
import './screens/single_order_screen.dart';
import 'screens/static_screen.dart';

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

  checkLogin() async {
    String? token = await auth.getToken();
    if (token != null) {
      setState(() {
        currentPage = const HomeScreen();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: ((context) => ProductProvider()),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: ((context) => UserProvider()),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: ((context) => CartProvider()),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: ((context) => WishListProvider()),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: ((context) => CheckoutProvider()),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: ((context) => OrderProvider()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColor.primaryColor,
            primarySwatch: AppColor.primarySwatch),
        home: currentPage,
        routes: {
          '/homescreen': (context) => const HomeScreen(),
          '/singleproductscreen': (context) => const SingleProductScreen(),
          '/profile-screen': (context) => const ProfileScreen(),
          '/cart-screen': (context) => const CartScreen(),
          '/products-list-screen': (context) => const ProductsListScreen(),
          '/wishlist-screen': (context) => const WishlistScreen(),
          '/address-screen': (context) => const AddressScreen(),
          '/add-address-screen': (context) => const AddAddressScreen(),
          '/order-summary-screen': (context) => const OrderSummaryScreen(),
          '/my-orders-screen': (context) => const MyOrdersScreen(),
          '/single-order-screen': (context) => const SingleOrderScreen(),
          '/terms-conditions-screen': (context) => const StaticScreen(),
          '/auth-screen': (context) => const AuthScreen()
        },
      ),
    );
  }
}
