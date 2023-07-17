// @dart=2.9
import 'package:finance_app/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light().copyWith(primary:primaryColor),
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: primaryColor,
          elevation: 0,
        ),
      ),
      home: MyHomePage(),
    );
  }
}