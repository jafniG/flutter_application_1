import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/storage/user_preference.dart';
import 'package:flutter_application_1/view/login_page.dart';
import 'package:flutter_application_1/view/shop_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserPreference.checkExistingUser().then((value) {
        if (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ShopPage()),
          );
          return;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }),
      builder: (context, snapshot) {
        return Scaffold(body: Center(child: Text("Splash Screen")));
      },
    );
  }
}
