import 'package:flutter/material.dart';

class HexColor extends Color {
  /// This file is exported with the liquid_components.dart file
  /// Make sure to import liquid_components.dart on any file you want to use
  /// To use, just instantiate the HexColor Class
  /// Here is an example of its usage
  // final light = ThemeData(
  //     brightness: Brightness.light,
  //     primaryColor: HexColor('#FFCD38'),
  //     primaryColorDark: HexColor('#AE7849'),
  //     primaryColorLight: Colors.black12,
  //     accentColor: Colors.black54,
  //     backgroundColor: HexColor('#fafafa'),
  //     fontFamily: 'Comfortaa',
  //   );

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
