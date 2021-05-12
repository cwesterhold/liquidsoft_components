import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

class LiquidButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final double fontSize;
  final Function() onPressed;
  final Color backgroundColor;

  LiquidButton(
      {required this.name,
      this.fontSize = 19,
      this.width = 88,
      this.height = 36,
      required this.onPressed,
      this.backgroundColor = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    LiquidSoftService _liquidService = LiquidSoftService();

    return _liquidService.getPlatformType == PlatformType.iOS
        ? CupertinoButton(
            onPressed: onPressed,
            minSize: width / 2,
            color: backgroundColor,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize == null ? 19.0 : fontSize,
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
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: backgroundColor == Colors.blueAccent
                      ? MaterialStateProperty.all<Color>(Theme.of(context).accentColor)
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
