import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';
import 'package:liquidsoft_components/widgets/liquidApproveDialog.dart';

import '../models/dao.dart';

class LiquidSoftService {
  PlatformInfo _platformInfo = PlatformInfo();

  PlatformGroup get getPlatformGroup {
    return _platformInfo.getPlatformGroup();
  }

  PlatformType get getPlatformType {
    return _platformInfo.getPlatformType();
  }

  catchError(String errorBody) {
    openDialog(Dao.inst.globalNavigatorKey.currentContext, Dao.inst.generalErrorHeader,
        '${Dao.inst.generalPreErrorMessage}  \n\n Error - $errorBody  \n\n${Dao.inst.generalPostErrorMessage}');
  }

  throwHTTPError(String resStatusCode, String resBody) {
    openDialog(Dao.inst.globalNavigatorKey.currentContext, Dao.inst.httpErrorHeader,
        '${Dao.inst.httpPreErrorMessage}  \n\n Error Code - $resStatusCode \n\n Error - $resBody  \n\n${Dao.inst.httpPostErrorMessage}');
  }

  throwConnectivityError() {
    openDialog(Dao.inst.globalNavigatorKey.currentContext, Dao.inst.connectivityErrorHeader,
        Dao.inst.connectivityErrorMessage);
  }

  routePage(context, Widget route) {
    return getPlatformType == PlatformType.iOS
        ? Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) {
                return route;
              },
            ),
          )
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return route;
              },
            ),
          );
  }

  showSnackBar(BuildContext context, String comment) {
    final snackBar = SnackBar(content: Text(comment));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String getDollarFormat(double dollarString) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';

    return '\$${dollarString.toStringAsFixed(2).replaceAllMapped(reg, mathFunc)}';
  }

  String numberFormat(double numberString, {String format = "###.0#", String locale = 'en_US'}) {
    var f = NumberFormat(format, locale);

    return f.format(numberString);
  }

  approvalDialog(BuildContext context, String title, String text, String approveButtonText,
      String denyButtonText, Function successCallback) async {
    final result = await showDialog(
      context: context,
      builder: (context) => LiquidApproveDialog(
        title: title,
        text: text,
        approveText: approveButtonText,
        denyText: denyButtonText,
      ),
    );

    if (result == 'Approve') {
      successCallback();
    }
  }

  openDialog(BuildContext context, String title, String text, {int numPops = 1}) {
    if (getPlatformType == PlatformType.iOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // set up the AlertDialog
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18.0,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= numPops);
                  },
                ),
              )
            ],
          );
        },
      );
    } else {
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // set up the AlertDialog
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18.0,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= numPops);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
