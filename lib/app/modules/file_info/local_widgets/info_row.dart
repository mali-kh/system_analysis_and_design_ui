import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String description;
  final bool hasIcon;
  const InfoRow({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
    this.hasIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (hasIcon)
                Icon(
                  icon,
                  size: 22,
                  color: color,
                ),
              if (hasIcon)
                SizedBox(
                  width: 7,
                ),
              Text(
                title,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 11,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
