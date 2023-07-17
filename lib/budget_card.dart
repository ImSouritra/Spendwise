
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'constants.dart';

class BudgetCard extends StatelessWidget {
  final double totalMonthlyBudget;
  final double remainingMoney;

  const BudgetCard(
      {required this.totalMonthlyBudget, required this.remainingMoney});

  @override
  Widget build(BuildContext context) {
    double percentage = ((2544.50 / 5000) * 100) / 100;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        color: whiteBackground,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 8.0,
            percent: percentage,
            progressColor: secondaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Monthly Budget",
                  style: TextStyle(
                      fontWeight: mediumFontWeight,
                      fontSize: mediumFontSize.toDouble(),
                      color: deepGreen),
                ),
              ),
              Expanded(
                child: Text(
                  "156 a day",
                  style: TextStyle(
                    fontSize: smallFontSize.toDouble(),
                    color: grayColor,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  "₹$remainingMoney",
                  style: TextStyle(
                      fontWeight: heavyFontWeight,
                      fontSize: 15,
                      color: deepGreen),
                ),
              ),
              Expanded(
                child: Text(
                  "of ₹$totalMonthlyBudget",
                  style: TextStyle(
                    fontSize: smallFontSize.toDouble(),
                    color: grayColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}