import 'package:flutter/material.dart';

Widget renderDetailsText(title, text, align) {
  return Flexible(
    child: RichText(
      textAlign: align,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: text,
          ),
        ],
      ),
    ),
  );
}
