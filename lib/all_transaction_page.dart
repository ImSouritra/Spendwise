import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class AllTransactionPage extends StatelessWidget {
  final List<Widget> cardChild;

  AllTransactionPage({required this.cardChild}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {
          Navigator.pop(context);
        },child: Icon(FontAwesomeIcons.arrowLeft, size: 30,color: Colors.black,)),
        title: Text(
          "Transactions",
          style: TextStyle(
              fontSize: 25,
              letterSpacing: 1.3,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(20),
        child: Column(
          children: cardChild,
        ),
      ),
    );
  }
}
