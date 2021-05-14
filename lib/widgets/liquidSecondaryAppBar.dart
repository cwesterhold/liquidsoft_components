import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class LiquidSecondaryAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget trailing;
  final Key? key;
  final double height;

  LiquidSecondaryAppBar(
      {required this.title,
      this.height = 56,
      this.trailing = const Text(''),
      this.key});

  @override
  _LiquidSecondaryAppBarState createState() => _LiquidSecondaryAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _LiquidSecondaryAppBarState extends State<LiquidSecondaryAppBar> {
  LiquidSoftService _liquidService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return _liquidService.getPlatformType == PlatformType.iOS
        ? CupertinoNavigationBar(
            key: widget.key,
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
            key: widget.key,
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
