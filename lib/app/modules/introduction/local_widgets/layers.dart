import 'package:flutter/material.dart';

class ColorLayer extends StatelessWidget {
  final double width;
  final double topMargin;
  final double height;
  final double topLeftRadius;
  final double topRightRadius;
  final Color startColor;
  final Color endColor;

  ColorLayer({
    required this.width,
    required this.topMargin,
    required this.height,
    required this.topLeftRadius,
    required this.topRightRadius,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
        ),
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
