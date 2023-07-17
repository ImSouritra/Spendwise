import 'dart:async';
import 'package:finance_app/constants.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greenBackground,
        image: DecorationImage(
          image: AssetImage("images/splashscreen_background.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(
        children: [
          // Rounded Rectangle Button at the bottom
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: secondaryColor,
              ),
              child: const Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: deepGreen,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
