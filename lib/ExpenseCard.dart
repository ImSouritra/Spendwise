 import 'package:flutter/material.dart';
import 'constants.dart';
class ExpenseCard extends StatelessWidget {
  final Widget? expenseChart;
  const ExpenseCard({
    super.key,
    required this.items, this.expenseChart,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: greenBackground,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Expense Summary",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₹12,450.56",
                style: TextStyle(
                    fontSize: bigFontSize.toDouble(),
                    fontWeight: heavyFontWeight,
                    color: textColor),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: items,
            ),
          ),
          SizedBox(height: 10,),
      Container(
        height: 200,
        child: expenseChart,
      ),
        ],
      ),
    );
  }
}
