import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  DetailsButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
