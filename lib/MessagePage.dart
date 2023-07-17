

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'contact_card.dart';

class MessagePage extends StatelessWidget {

  final void Function() onPress;

  MessagePage({required this.onPress}){}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(20),
        color: primaryColor,
        child: Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(
                    width: 1, color: greenBackground), // Add a border
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      // Replace the Text widget with a TextField widget
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: mediumFontSize.toDouble(),
                            fontWeight: mediumFontWeight,
                            color: grayColor),
                        hintText: "Select Contact", // Add a hint text
                        border: InputBorder.none, // Remove the border
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: greenBackground,
                  ),
                ],
              ),
            ),
            ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                ContactCard(image: 'images/man.png', name: 'Eric Peterson', contact: '9123065792', iconColor:grayColor, onPress:onPress ,),
                ContactCard(image: 'images/woman.png', name: 'Eric Peterson', contact: '9123065792', iconColor:grayColor, onPress:onPress ,),
                ContactCard(image: 'images/man.png', name: 'Eric Peterson', contact: '9123065792', iconColor:grayColor, onPress:onPress ,),
                ContactCard(image: 'images/woman.png', name: 'Eric Peterson', contact: '9123065792', iconColor:grayColor, onPress:onPress ,),
                ContactCard(image: 'images/woman.png', name: 'Eric Peterson', contact: '9123065792', iconColor:grayColor, onPress:onPress ,),
                ContactCard(image: 'images/man.png', name: 'Eric Peterson', contact: '9123065792', iconColor:grayColor, onPress:onPress ,),

              ],
            )
          ],
        ),
      ),
    );
  }
}
