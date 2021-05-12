import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

import '../dao.dart';

class LiquidService {
  PlatformInfo _platformInfo = PlatformInfo();

  PlatformGroup get getPlatformGroup {
    return _platformInfo.getPlatformGroup();
  }

  PlatformType get getPlatformType {
    return _platformInfo.getPlatformType();
  }

  throwHTTPError(String resStatusCode, String resBody) {
    openDialog(Dao.inst.globalNavigatorKey, 1, Dao.inst.httpErrorHeader,
        '${Dao.inst.httpPreErrorMessage}  \n\n Error Code - $resStatusCode \n\n Error - $resBody  \n\n{Dao.inst.httpPostErrorMessage}');
  }

  throwConnectivityError() {
    openDialog(Dao.inst.globalNavigatorKey, 1, Dao.inst.connectivityErrorHeader,
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

    return dollarString.toStringAsFixed(2).replaceAllMapped(reg, mathFunc);
  }

  appBar(BuildContext context, String title, {Widget trailing = const Text('')}) {
    return getPlatformType == PlatformType.iOS
        ? CupertinoNavigationBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 25.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            automaticallyImplyLeading: false,
            middle: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18.0,
                ),
              ), //Text
            ),
            trailing: trailing)
        : AppBar(
            backgroundColor: Theme.of(context).canvasColor,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 25.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18.0,
              ),
            ),
            actions: [trailing],
          );
  }

  openDialog(BuildContext context, int numPops, String title, String text) {
    numPops == null ? numPops = 1 : numPops = numPops;

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
                child: FlatButton(
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
              FlatButton(
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
