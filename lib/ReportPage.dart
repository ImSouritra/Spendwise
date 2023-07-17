import 'package:finance_app/report_card.dart';
import 'package:finance_app/section_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ExpenseCard.dart';
import 'constants.dart';
import 'frequently_used_card.dart';

class ReportPage extends StatelessWidget {
  final List<Widget> items;
  final Widget? expenseChart;

  ReportPage({required this.items, this.expenseChart}) {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(20),
        color: primaryColor,
        child: Column(
          children: [
            ExpenseCard(items: items, expenseChart: expenseChart,),
            SizedBox(
              height: 10,
            ),
            SectionHeader(headerText: 'Frequently Used'),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                FrequentlyUsedCard(
                  icon: FontAwesomeIcons.arrowRight,
                  paddingNumber: 8,
                  name: "Transfers",
                  iconColor: textColor,
                  onPress: () {},
                ),
                FrequentlyUsedCard(
                  icon: FontAwesomeIcons.wallet,
                  paddingNumber: 8,
                  name: "Payments",
                  iconColor: Colors.white,
                  onPress: () {},
                ),
                FrequentlyUsedCard(
                  icon: FontAwesomeIcons.fantasyFlightGames,
                  paddingNumber: 8,
                  name: "Games",
                  iconColor: Colors.white,
                  onPress: () {},
                ),
                FrequentlyUsedCard(
                  icon: FontAwesomeIcons.ticket,
                  paddingNumber: 8,
                  name: "Tickets",
                  iconColor: Colors.white,
                  onPress: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SectionHeader(headerText: "Monthly Report"),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ReportCard(icon: FontAwesomeIcons.bus, expense: 950.50, percentage: 26, category: "Transport",),
                ReportCard(icon: Icons.restaurant, expense: 350.25, percentage: 12, category: "Food",),
                ReportCard(icon: FontAwesomeIcons.shoppingCart, expense: 480.20, percentage: 18, category: "Shopping",),
                ReportCard(icon: FontAwesomeIcons.kitMedical, expense: 250.50, percentage: 10, category: "Medical",),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
