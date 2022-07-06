import 'package:flutter/material.dart';

import '../ui/colors.dart';
import '../widgets/custom_appbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const routeName = '/checkout-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: CustomAppBar(title: 'Checkout'),
    );
  }
}
