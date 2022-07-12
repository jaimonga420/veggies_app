import 'package:flutter/material.dart';

import '../ui/colors.dart';

class StaticScreen extends StatelessWidget {
  const StaticScreen({Key? key}) : super(key: key);

  static const routeName = '/terms-conditions-screen';

  @override
  Widget build(BuildContext context) {
    String appBarTitle = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColor.primaryColor,
        title: Text(
          appBarTitle,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        height: double.maxFinite,
        child: const Text(
            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to'),
      ),
    );
  }
}
