import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';


class SettingCard extends StatelessWidget {
  SettingCard({
    required this.settingHeadline, required this.settingsSubText,
  });
  final String settingHeadline;
  final String settingsSubText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15 ),

      child: Row(
        children: [

          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                settingHeadline,
                style: TextStyle(
                    fontSize: mediumFontSize.toDouble(),
                    fontWeight: mediumFontWeight,
                    color: deepGreen),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                settingsSubText,
                style: TextStyle(
                    fontSize: smallFontSize.toDouble(), color: grayColor),
              ),
            ],
          ),
          Spacer(),
          Icon(FontAwesomeIcons.arrowRight,color: grayColor,size: 20,)
        ],
      ),
    );
  }
}
