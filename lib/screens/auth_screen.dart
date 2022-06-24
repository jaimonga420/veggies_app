import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/auth.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/background.png',
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign-in to continue',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Veggies App',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.green.shade900,
                              offset: const Offset(3, 0),
                            )
                          ]),
                    ),
                  ),
                  signInButton('assets/images/google.svg',
                      'Sign in with Google', true, context),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: signInButton('assets/images/mail.svg',
                        'Sign in with Email', false, context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget signInButton(
    String imagePath, String label, bool isGoogle, BuildContext context) {
  Auth auth = Auth();
  return ElevatedButton.icon(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.resolveWith<Size>(
              (states) => const Size(250, 40)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Colors.white)),
      onPressed: isGoogle
          ? () async {
              await auth.googleSignIn(context);
            }
          : () {},
      icon: SvgPicture.asset(
        imagePath,
        width: 35,
        height: 35,
      ),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ));
}
