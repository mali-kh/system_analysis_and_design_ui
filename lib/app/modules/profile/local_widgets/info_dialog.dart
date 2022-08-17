import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './name_list_tile.dart';

class TeamInfoDialog extends StatelessWidget {
  final ThemeData theme;

  const TeamInfoDialog({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Nice!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(backgroundColor: theme.primaryColor),
        ),
      ],
      title: SvgPicture.asset(
        'assets/svgs/title.svg',
        // height: 50,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "This app was made by the SAD team for the System Design and Analysis course at Sharif University of Technology instructed by Dr. Mahdi Mostafazade.",
            softWrap: true,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Creators:",
            ),
          ),
          NameListTile(
              color: theme.primaryColor,
              name: "Mohammadali Khodabandelou",
              role: "Frontend"),
          NameListTile(
              color: theme.primaryColor,
              name: "Mohammad Abolnejadian",
              role: "Frontend"),
          NameListTile(
            color: theme.primaryColor,
            name: "Alireza Eiji",
            role: "Backend",
          ),
          NameListTile(
              color: theme.primaryColor,
              name: "Matin Daghyani",
              role: "Backend"),
          NameListTile(
              color: theme.primaryColor,
              name: "Amirreza Mirzaei",
              role: "Backend"),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Summer 2022",
              style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
