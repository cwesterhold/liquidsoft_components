import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// returns a smaller button than the normal LiquidButton

class LiquidSmallButton extends StatelessWidget {
  /// button text
  final String name;

  /// width of button
  final double width;

  /// height of button
  final double height;

  /// font size
  final double fontSize;

  final Color textColor;

  /// background color
  final Color backgroundColor;

  /// border color
  final Color borderColor;

  /// onPressed function
  final Function() onPressed;

  /// optional key
  final Key? key;

  LiquidSmallButton(
      {required this.name,
      this.fontSize = 19.0,
      this.width = 88.0,
      this.height = 36.0,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.blueAccent,
      this.borderColor = Colors.black12,
      required this.onPressed,
      this.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        key: key,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
        ),
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
    );
  }
}
