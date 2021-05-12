import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class LiquidSecondaryAppBar extends StatefulWidget {
  final String title;
  final Widget trailing;

  LiquidSecondaryAppBar({required this.title, this.trailing = const Text('')});

  @override
  _LiquidSecondaryAppBarState createState() => _LiquidSecondaryAppBarState();
}

class _LiquidSecondaryAppBarState extends State<LiquidSecondaryAppBar> {
  LiquidSoftService _liquidService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return _liquidService.getPlatformType == PlatformType.iOS
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
                widget.title,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18.0,
                ),
              ), //Text
            ),
            trailing: widget.trailing)
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
              widget.title,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18.0,
              ),
            ),
            actions: [widget.trailing],
          );
  }
}
