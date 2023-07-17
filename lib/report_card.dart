
import 'package:flutter/material.dart';
import 'constants.dart';

class ReportCard extends StatelessWidget {

  final IconData icon;
  final double expense;
  final double percentage;
  final String category;

  ReportCard({Key? key, required this.icon, required this.expense, required this.percentage, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: secondaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "₹$expense",
                style: TextStyle(
                    fontSize: mediumFontSize.toDouble(),
                    color: deepGreen,
                    fontWeight: mediumFontWeight),
              ),
              Spacer(),
              Text(
                "$percentage%",
                style: TextStyle(
                    fontSize: mediumFontSize.toDouble(),
                    color: deepGreen,
                    fontWeight: mediumFontWeight),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(category,style: TextStyle(fontSize:smallFontSize.toDouble(),color: grayColor, ),),
            ],
          ),
        ],
      ),
    );
  }
}
