import 'package:finance_app/TransactionPage.dart';
import 'package:finance_app/ReportPage.dart'; // Import the ReportPage.dart file
import 'package:finance_app/all_transaction_page.dart';
import 'package:finance_app/login_page.dart';
import 'package:finance_app/monthly_expense_data.dart';
import 'package:finance_app/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'MessagePage.dart';
import 'ProfilePage.dart';
import 'constants.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

enum IconName { empty, home, wallet, message, person }

enum TimePeriod { day, week, month, year }

bool isLoggedIn = false;

String userFirstName = userData["userFirstName"];

class InputPage extends StatefulWidget {
  InputPage({required this.userData}) {}

  final Map<String, dynamic> userData;



  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  IconName selectedIcon =
      IconName.home; // Set the default selectedIcon to IconName.home

  TimePeriod selectedTimePeriod = TimePeriod.day;
  String userLastName = userData["userLastName"];
  String userAccNumber = userData["accNumber"];
  String lastFourDigitAccNumber =
      userData["accNumber"].substring(userData["accNumber"].length - 4);
  String userEmail = userData["userEmail"];
  String appBarTitle = "Hello, $userFirstName";
  String profilePhoto = userData["userPhoto"];
  Color appBarColor = primaryColor;

  // The sms retrieving functionality starts from here

  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  String _searchText = 'SBIUPI';

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    var status = await Permission.sms.request();
    if (status.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
      );
      setState(() => _messages = messages);
    } else if (status.isDenied) {
      debugPrint('Permission denied by user.');
    } else if (status.isPermanentlyDenied) {
      debugPrint('Permission permanently denied by user.');
      // You can navigate to the device's app settings to allow the user to grant permission.
      openAppSettings();
    }
  }

  List<SmsMessage> _getFilteredMessages() {
    if (_searchText.isEmpty) {
      return _messages;
    } else {
      return _messages
          .where((msg) =>
              msg.address != null &&
              msg.address!.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }
  }

  String _getAmount(String body) {
    final startIndex = body.toLowerCase().indexOf('rs') + 2;
    final endIndex = body.toLowerCase().indexOf('on');
    return body.substring(startIndex, endIndex).trim();
  }

  String? _getReceiver(String body) {
    final debitedIndex = body.toLowerCase().indexOf('debited');
    if (debitedIndex == -1) {
      return "User";
    }
    final toIndex = body.toLowerCase().indexOf('to', debitedIndex);
    final refIndex = body.toLowerCase().indexOf('ref', toIndex);
    return body.substring(toIndex + 3, refIndex).trim();
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    if (diff == 0) {
      return 'Today';
    } else if (diff == 1) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM d').format(date);
    }
  }

// End of Sms function

  Widget currentBodyWidget() {
    // Define a method that returns the current body widget based on the selectedIcon
    switch (selectedIcon) {
      case IconName.home:
        return isLoggedIn
            ? TransactionPage(
                accBalance: "46325.25",
                fullName: '$userFirstName $userLastName',
                accNumber: '* * * * $lastFourDigitAccNumber',
                items: _getFilteredMessages().isEmpty
                    ? [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Fetching your latest transactions'),
                      ] // Return an empty list if there are no messages
                    : List.generate(
                        5,
                        (index) {
                          var message = _getFilteredMessages()[index];
                          return TransactionCard(
                            icon: FontAwesomeIcons.person,
                            name: '${_getReceiver(message.body!)}',
                            date: formatDate(message.date!),
                            amount: _getAmount(message.body!),
                            amountColor:
                                ('${_getReceiver(message.body!)}' == 'User')
                                    ? Colors.green
                                    : Colors.red,
                            sign: ('${_getReceiver(message.body!)}' == 'User')
                                ? "+"
                                : "-",
                          );
                        },
                      ),
                onMorePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllTransactionPage(
                        cardChild: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 30,
                              itemBuilder: (BuildContext context, int index) {
                                var message = _getFilteredMessages()[index];

                                return TransactionCard(
                                  icon: FontAwesomeIcons.person,
                                  name: '${_getReceiver(message.body!)}',
                                  date: formatDate(message.date!),
                                  amount: _getAmount(message.body!),
                                  amountColor:
                                  ('${_getReceiver(message.body!)}' == 'User')
                                      ? Colors.green
                                      : Colors.red,
                                  sign: ('${_getReceiver(message.body!)}' == 'User')
                                      ? "+"
                                      : "-",
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : LoginPage();
      case IconName.wallet:
        return ReportPage(
          items: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: selectedTimePeriod == TimePeriod.day
                      ? Border(
                          bottom: BorderSide(width: 2, color: Colors.yellow),
                        )
                      : null,
                ),
                child: Text(
                  "Day",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: selectedTimePeriod == TimePeriod.day
                        ? secondaryColor
                        : textColor,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedTimePeriod = TimePeriod.day;
                });
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: selectedTimePeriod == TimePeriod.week
                      ? Border(
                          bottom: BorderSide(width: 3, color: Colors.yellow),
                        )
                      : null,
                ),
                child: Text(
                  "Week",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: selectedTimePeriod == TimePeriod.week
                        ? secondaryColor
                        : textColor,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedTimePeriod = TimePeriod.week;
                });
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: selectedTimePeriod == TimePeriod.month
                      ? Border(
                          bottom: BorderSide(width: 2, color: Colors.yellow),
                        )
                      : null,
                ),
                child: Text(
                  "Month",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: selectedTimePeriod == TimePeriod.month
                        ? secondaryColor
                        : textColor,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedTimePeriod = TimePeriod.month;
                });
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: selectedTimePeriod == TimePeriod.year
                      ? Border(
                          bottom: BorderSide(width: 2, color: Colors.yellow),
                        )
                      : null,
                ),
                child: Text(
                  "Year",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: selectedTimePeriod == TimePeriod.year
                        ? secondaryColor
                        : textColor,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedTimePeriod = TimePeriod.year;
                });
              },
            ),
          ],expenseChart: (selectedTimePeriod==TimePeriod.day)?SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            LineSeries<dynamic, String>(
              dataSource: dailyExpenseData,
              xValueMapper: (dynamic data, _) => data['date'].toString(),
              yValueMapper: (dynamic data, _) => data['expense'],
            ),
          ],
        ):SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            LineSeries<dynamic, String>(
              dataSource: monthlyExpenseData,
              xValueMapper: (dynamic data, _) => data['month'].toString(),
              yValueMapper: (dynamic data, _) => data['expense'],
            ),
          ],
        )
        );
      case IconName.message:
        return MessagePage(
          onPress: () {},
        );
      case IconName.person:
        return ProfilePage(
          profilePhoto: "images/man.png",
          userName: userFirstName + " " + userLastName,
          userEmail: userEmail,
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isLoggedIn
          ? AppBar(
              backgroundColor: appBarColor,
              leading: GestureDetector(
                onTap: () {
                  if (selectedIcon==IconName.home){
                    print("profile photo pressed");
                  }else{
                    print("Back button was pressed");
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 30,
                    backgroundImage: AssetImage(profilePhoto),
                  ),
                ),
              ),
              actions: [
                Icon(
                  Icons.notifications,
                  color: grayColor,
                ),
                SizedBox(
                  width: 10,
                )
              ],
              title: Text(
                appBarTitle,
                style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          : null,
      body:
          currentBodyWidget(), // Use the currentBodyWidget method to determine the body widget
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isLoggedIn
          ? Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: FractionallySizedBox(
                widthFactor: 0.95,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: greenBackground,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            Icons.home_filled,
                            size: 40,
                            color: selectedIcon == (IconName.home)
                                ? secondaryColor
                                : grayColor,
                          ),
                          onTap: () {
                            setState(
                              () {
                                selectedIcon = IconName.home;
                                appBarTitle = "Hello, $userFirstName";
                                appBarColor = primaryColor;
                                profilePhoto = userData["userPhoto"];
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            Icons.wallet,
                            size: 40,
                            color: selectedIcon == (IconName.wallet)
                                ? secondaryColor
                                : grayColor,
                          ),
                          onTap: () {
                            setState(() {
                              selectedIcon = IconName.wallet;
                              appBarTitle = "Expenses";
                              appBarColor = primaryColor;
                              profilePhoto = "images/back.png";
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            Icons.message_rounded,
                            size: 40,
                            color: selectedIcon == (IconName.message)
                                ? secondaryColor
                                : grayColor,
                          ),
                          onTap: () {
                            setState(() {
                              selectedIcon = IconName.message;
                              appBarTitle = "Contacts";
                              appBarColor = primaryColor;
                              profilePhoto = "images/back.png";
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: selectedIcon == (IconName.person)
                                ? secondaryColor
                                : grayColor,
                          ),
                          onTap: () {
                            setState(() {
                              selectedIcon = IconName.person;
                              appBarTitle = "Profile";
                              appBarColor = primaryColor;
                              profilePhoto = "images/back.png";
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
