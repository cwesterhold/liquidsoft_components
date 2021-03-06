import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';
import 'package:liquidsoft_components/widgets/liquidApproveDialog.dart';

import '../models/dao.dart';
import 'liquidHTTPCaller.dart';

class LiquidSoftService {
  PlatformInfo _platformInfo = PlatformInfo();

  PlatformGroup get getPlatformGroup {
    return _platformInfo.getPlatformGroup();
  }

  PlatformType get getPlatformType {
    return _platformInfo.getPlatformType();
  }

  GlobalKey<NavigatorState> get navigatorKey {
    return Dao.inst.globalNavigatorKey;
  }

  sendMail(String contactEmail, String contactName, String subject,
      String message) async {
    LiquidHTTPCaller _httpCaller = LiquidHTTPCaller();

    _httpCaller.postData('https://api.liquidsoft.io/SendGrid/', {
      "personalizations": [
        {
          "to": [
            {
              'email': contactEmail,
              'name': contactName,
            }
          ],
          "subject": subject,
        }
      ],
      "from": {
        "email": "mailer@liquidsoft.io",
        'name': "Customer Service",
      },
      "reply_to": {
        "email": "chris@liquidsoft.io",
        'name': "Customer Service",
      },
      "content": [
        {
          "type": "text/html",
          "value": message,
        }
      ]
    });
  }

  catchError(String errorBody) {
    Dao.inst.isDebug == true
        ? openDialog(Dao.inst.generalErrorHeader,
            '${Dao.inst.generalPreErrorMessage}  \n\n Error - $errorBody  \n\n${Dao.inst.generalPostErrorMessage}')
        : print(
            '${Dao.inst.generalPreErrorMessage}  \n\n Error - $errorBody  \n\n${Dao.inst.generalPostErrorMessage}');
  }

  throwHTTPError(String resStatusCode, String resBody) {
    Dao.inst.isDebug == true
        ? openDialog(Dao.inst.httpErrorHeader,
            '${Dao.inst.httpPreErrorMessage}  \n\n Error Code - $resStatusCode \n\n Error - $resBody  \n\n${Dao.inst.httpPostErrorMessage}')
        : print(
            '${Dao.inst.httpPreErrorMessage}  \n\n Error Code - $resStatusCode \n\n Error - $resBody  \n\n${Dao.inst.httpPostErrorMessage}');
  }

  throwConnectivityError() {
    openDialog(
        Dao.inst.connectivityErrorHeader, Dao.inst.connectivityErrorMessage);
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

  showSnackBar(String comment) {
    final snackBar = SnackBar(content: Text(comment));
    ScaffoldMessenger.of(Dao.inst.globalNavigatorKey.currentContext)
        .showSnackBar(snackBar);
  }

  String getDollarFormat(double dollarString) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';

    return '\$${dollarString.toStringAsFixed(2).replaceAllMapped(reg, mathFunc)}';
  }

  String numberFormat(double numberString,
      {String format = "###.0#", String locale = 'en_US'}) {
    var f = NumberFormat(format, locale);

    return f.format(numberString);
  }

  approvalDialog(String title, String text, String approveButtonText,
      String denyButtonText, Function successCallback) async {
    final result = await showDialog(
      context: Dao.inst.globalNavigatorKey.currentContext,
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

  openDialog(String title, String text, {int numPops = 1}) {
    if (getPlatformType == PlatformType.iOS) {
      showDialog(
        context: Dao.inst.globalNavigatorKey.currentContext,
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
        context: Dao.inst.globalNavigatorKey.currentContext,
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
