import 'package:finance_app/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InputPage(userData: {
      'userId': 0,
      'userFirstName': '',
      'userLastName' : '',
      'userEmail': '',
      'userPassword': '',
      'userPhoto': '',
    },);
  }
}
