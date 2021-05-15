import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// Returns a Material spinner or a Cupertino spinner based on platform

class LiquidSpinner extends StatelessWidget {
  /// text to show over the spinner
  final String? title;

  ///optional Key
  final Key? key;

  LiquidSpinner({required this.title, this.key});

  @override
  Widget build(BuildContext context) {
    LiquidSoftService _liquidService = LiquidSoftService();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                title!,
                style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa'),
              ),
            ),
          _liquidService.getPlatformType == PlatformType.iOS
              ? CupertinoActivityIndicator(
                  key: key,
                )
              : CircularProgressIndicator(
                  key: key,
                ),
        ],
      ),
    );
  }
}
