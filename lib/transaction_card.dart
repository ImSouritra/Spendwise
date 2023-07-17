
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class TransactionCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String date;
  final String amount;
  final Color amountColor;
  final String sign;

  TransactionCard({
    required this.icon,
    required this.name,
    required this.date,
    required this.amount,
    required this.amountColor,
    required this.sign
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: mediumFontSize.toDouble(),
                    fontWeight: mediumFontWeight,
                    color: deepGreen),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: TextStyle(
                    fontSize: smallFontSize.toDouble(), color: grayColor),
              ),
            ],
          ),
          Spacer(),
          Text(
            "$sign ₹$amount",
            style: TextStyle(
                color: amountColor,
                fontWeight: mediumFontWeight,
                fontSize: mediumFontSize.toDouble()),
          )
        ],
      ),
    );
  }
}

