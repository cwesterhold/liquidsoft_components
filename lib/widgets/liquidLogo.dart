import 'package:flutter/material.dart';

import '../dao.dart';

class LiquidLogo extends StatelessWidget {
  LiquidLogo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 230),
        child: Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? Dao.inst.logoLocationLight
              : Dao.inst.logoLocationDark,
        ),
      ),
    );
  }
}
