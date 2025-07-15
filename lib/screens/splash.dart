import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reforumasisten/screens/login.dart';
import 'package:reforumasisten/utils/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          'assets/logo/logoapp.png',
          width: 150, // Sesuaikan ukuran logo
          height: 150,
        ),
      ),
    );
  }
}
