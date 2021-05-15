import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// Returns a Material Button or a Cupertino Button based on platform

class LiquidButton extends StatelessWidget {
  /// the text in the center of the button
  final String name;

  /// the overall width of the button
  final double width;

  /// the height of the button
  final double height;

  /// Font size of the button text
  final double fontSize;

  /// function to call on the button press
  final Function() onPressed;

  /// color of the background
  final Color backgroundColor;

  /// key for the button - optional
  final Key? key;

  ///The only required fields are name and onPressed
  LiquidButton(
      {required this.name,
      this.fontSize = 19,
      this.width = 88,
      this.height = 36,
      required this.onPressed,
      this.backgroundColor = Colors.blueAccent,
      this.key});

  @override
  Widget build(BuildContext context) {
    LiquidSoftService _liquidService = LiquidSoftService();

    return _liquidService.getPlatformType == PlatformType.iOS
        ? CupertinoButton(
            key: key,
            onPressed: onPressed,
            minSize: width / 2,
            color: backgroundColor,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontFamily: 'Comfortaa',
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ButtonTheme(
              minWidth: width,
              height: height,
              child: TextButton(
                key: key,
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: backgroundColor == Colors.blueAccent
                      ? MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor)
                      : MaterialStateProperty.all<Color>(backgroundColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kIsWeb ? 12 : 5),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
