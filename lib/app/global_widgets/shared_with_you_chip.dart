import 'package:flutter/material.dart';

class SharedWithYouChip extends StatelessWidget {
  final ThemeData theme;
  const SharedWithYouChip({
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            // vertical: 1,
          ),
          child: Row(
            children: [
              Icon(
                Icons.group_outlined,
                size: 13,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "Shared With You",
                style: TextStyle(
                  fontSize: 7.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
