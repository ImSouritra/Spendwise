
import 'package:finance_app/constants.dart';
import 'package:finance_app/section_header.dart';
import 'package:flutter/material.dart';
import 'account_card.dart';
import 'budget_card.dart';

class TransactionPage extends StatelessWidget {
  final List<Widget> items;
  final String accBalance;
  final String fullName;
  final String accNumber;
  final void Function() onMorePressed;


  TransactionPage({required this.items, required this.fullName, required this.accNumber, required this.accBalance, required this.onMorePressed}){}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(20),
        color: primaryColor,
        child: Column(
          children: [
            AccountCard(
              balance: accBalance,
              name: fullName,
              accNumber: accNumber,
            ),
            BudgetCard(
              totalMonthlyBudget: 5000,
              remainingMoney: 2544.50,
            ),
            SectionHeader(headerText: 'Transactions',onMorePressed: onMorePressed,),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: whiteBackground),
              child: Column(
                children: items,
              ),
            )
          ],
        ),
      ),
    );
  }
}
