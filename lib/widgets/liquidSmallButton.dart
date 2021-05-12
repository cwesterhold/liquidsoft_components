import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_components/services/hexcolor.dart';
import 'package:liquid_components/services/liquidServices.dart';

class LiquidSmallButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final double fontSize;
  final Function() onPressed;

  LiquidSmallButton(
      {required this.name,
      this.fontSize = 19.0,
      this.width = 88.0,
      this.height = 36.0,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    LiquidService _liquidService = LiquidService();

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: RaisedButton(
        color: HexColor("#E4E5E8"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: HexColor('#D9965B'))),
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            color: HexColor('#07305D'),
            fontSize: 19.0,
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
    );
  }
}
