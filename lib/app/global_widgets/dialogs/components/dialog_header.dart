import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  // final Color iconColor;
  // final Color titleColor;
  // final Color subtitleColor;

  const DialogHeader({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    // required this.iconColor,
    // this.titleColor = Colors.black,
    // this.subtitleColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mq = MediaQuery.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.primaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: mq.size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
