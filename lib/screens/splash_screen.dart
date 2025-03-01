// ignore_for_file: unused_import, avoid_web_libraries_in_flutter

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto_quotient/screens/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function(String) onChangeLanguage;
  const SplashScreen({super.key, required this.onChangeLanguage});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //bool? isOnBoarding;
  @override
  initState() {
    //load();
    super.initState();
  }

  // load() async {
  //   final pres = await SharedPreferences.getInstance();
  //   isOnBoarding = pres.getBool("onboarding") ?? false;
  // }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MenuScreen(
                    onChangeLanguage: widget.onChangeLanguage,
                  )));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 280,
              width: 280,
              child: Image.asset("assets/images/mainLogo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
