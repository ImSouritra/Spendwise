import 'package:flutter/material.dart';
import 'constants.dart';


class FrequentlyUsedCard extends StatelessWidget {
  final IconData icon;
  final double paddingNumber;
  final Color? iconColor;
  final String name;
  final void Function() onPress;

  FrequentlyUsedCard({
    required this.icon,
    required this.name,
    this.iconColor,
    required this.paddingNumber,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFe5f7e3),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(paddingNumber),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greenBackground,
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: smallFontSize.toDouble(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
