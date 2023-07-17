import 'package:finance_app/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(
      {required this.profilePhoto,
      required this.userName,
      required this.userEmail}) {}
  final String profilePhoto;
  final String userName;
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(20),
        color: primaryColor,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(profilePhoto),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                            fontSize: bigFontSize.toDouble(),
                            fontWeight: heavyFontWeight,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        userEmail,
                        style: TextStyle(
                            fontSize: smallFontSize.toDouble(),
                            fontWeight: mediumFontWeight,
                            color: grayColor,
                            letterSpacing: 1),
                      )
                    ],
                  )
                ],
              ),
            ),
            SettingCard(settingHeadline: 'Security', settingsSubText: 'Password & Pin',),
            SettingCard(settingHeadline: 'Personal Information', settingsSubText: 'Name, Email, Number, Address',),
            SettingCard(settingHeadline: 'Bank Information', settingsSubText: 'Account Number, Bank Name',),
            SettingCard(settingHeadline: "Terms and Conditions", settingsSubText: "Agreement to Terms"),
            SizedBox(height: 20,),
            SettingCard(settingHeadline: "Additional Information", settingsSubText: "Legal Document"),
            SettingCard(settingHeadline: 'Logout', settingsSubText: '',),
            SettingCard(settingHeadline: '', settingsSubText: '',)
          ],
        ),
      ),
    );
  }



}

