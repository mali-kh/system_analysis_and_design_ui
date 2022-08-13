import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final ThemeData theme;

  const TitleText({
    required this.text,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: theme.primaryColor,
        fontSize: 20,
      ),
    );
  }
}
