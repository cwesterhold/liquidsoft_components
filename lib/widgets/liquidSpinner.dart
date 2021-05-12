import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_components/services/liquidServices.dart';
import 'package:liquid_components/services/platformInfo.dart';

class LiquidSpinner extends StatelessWidget {
  final String title;

  LiquidSpinner({required this.title});

  @override
  Widget build(BuildContext context) {
    LiquidService _liquidService = LiquidService();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa'),
            ),
          ),
          _liquidService.getPlatformType == PlatformType.iOS
              ? CupertinoActivityIndicator()
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
