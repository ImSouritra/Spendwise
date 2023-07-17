import 'package:flutter/material.dart';
import 'constants.dart';


class SectionHeader extends StatelessWidget {
  final String headerText;
  final void Function()? onMorePressed;

  SectionHeader({required this.headerText, this.onMorePressed}){}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            headerText,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: mediumFontWeight,
              fontSize: bigFontSize.toDouble(),
              color: deepGreen,
            ),
          ),
          Flexible(fit: FlexFit.tight, child: SizedBox()),
          GestureDetector(
            onTap: onMorePressed,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}