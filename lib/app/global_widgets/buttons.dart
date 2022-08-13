import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String name;
  final Function onTap;

  CommonButton({required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SadButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;

  SadButton({
    required this.title,
    required this.onTap,
    required this.color,
    required this.textColor,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
