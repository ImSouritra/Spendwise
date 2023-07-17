import 'package:flutter/material.dart';

import 'constants.dart';


class AccountCard extends StatelessWidget {

  final String balance;
  final String name;
  final String accNumber;

  AccountCard({
    required this.balance,
    required this.name,
    required this.accNumber

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,0,0,20),
      padding: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        color: greenBackground,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: AssetImage("images/container_background.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "₹$balance",
                    style: TextStyle(
                        fontSize: bigFontSize.toDouble(),
                        fontWeight: heavyFontWeight,
                        color: textColor),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 10,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: mediumFontSize.toDouble(),
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        letterSpacing: 1.2),
                  ),
                  Spacer(),
                  Text(
                    "$accNumber",
                    style: TextStyle(
                        fontSize: mediumFontSize.toDouble(),
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        letterSpacing: 1.2),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
