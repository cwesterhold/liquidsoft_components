import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

import '../models/dao.dart';

class LiquidLogo extends StatefulWidget {
  @override
  _LiquidLogoState createState() => _LiquidLogoState();
}

class _LiquidLogoState extends State<LiquidLogo> {
  LiquidSoftService _liquidService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return Dao.inst.logoLocationLight == null
        ? _liquidService.openDialog(context, 'Component Error',
            'Logos where not initialized so this widget will not work.')
        : Padding(
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
