import 'package:flutter/material.dart';

class LiquidHeader extends StatelessWidget {
  final String labelText;
  final double fontSize;

  LiquidHeader({required this.labelText, this.fontSize = 28});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              labelText,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
