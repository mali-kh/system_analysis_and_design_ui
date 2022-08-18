import 'package:flutter/material.dart';

class DialogSubmitButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final VoidCallback onPressed;
  const DialogSubmitButton({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
        // padding: EdgeInsets.all(),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
