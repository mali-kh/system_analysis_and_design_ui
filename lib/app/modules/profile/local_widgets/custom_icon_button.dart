import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/values/strings.dart';

class CustomIconButton extends StatelessWidget {
  final ThemeData theme;
  final double width;
  final double height;
  final double borderRadius;
  final double iconSize;
  final Color textColor;
  final Color iconColor;
  final IconData icon;
  final Color buttonColor;
  final String buttonText;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.theme,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.iconSize,
    required this.textColor,
    required this.iconColor,
    required this.icon,
    required this.buttonColor,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Row(
          children: [
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
              ),
            ),
            FaIcon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
