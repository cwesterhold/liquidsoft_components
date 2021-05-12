import 'package:flutter/material.dart';

class LiquidLogo extends StatelessWidget {
  final String assetLocationLight;
  final String assetLocationDark;

  LiquidLogo({required this.assetLocationLight, required this.assetLocationDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 230),
        child: Image.asset(
          Theme.of(context).brightness == Brightness.light ? assetLocationLight : assetLocationDark,
        ),
      ),
    );
  }
}
