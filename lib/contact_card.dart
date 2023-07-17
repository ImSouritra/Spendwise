import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class ContactCard extends StatelessWidget {
  ContactCard({
    required this.image, required this.name, required this.contact, required this.iconColor, required this.onPress,
  });

  final String image;
  final String name;
  final String contact;
  final Color iconColor ;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                padding:EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25), // Assuming the width and height of the image are both 50
                  child: Image.asset(
                    image,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: mediumFontSize.toDouble(),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    contact,
                    style: TextStyle(
                        fontSize: smallFontSize.toDouble(),
                        color: grayColor),
                  ),
                ],
              ),
              Spacer(),
              Icon(FontAwesomeIcons.solidCircle,size: 15,color: iconColor,),
              SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
