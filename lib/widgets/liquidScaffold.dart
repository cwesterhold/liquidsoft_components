import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class LiquidScaffold extends StatefulWidget {
  /// Provide a key for the scaffold
  final Key? key;

  /// List of items to navBar items to feed into the scaffold
  /// Each list item will get a nav bar item and a appbar
  final List<NavBarItems> items;

  LiquidScaffold({
    this.key,
    required this.items,
  });

  @override
  _LiquidScaffoldState createState() => _LiquidScaffoldState();
}

class _LiquidScaffoldState extends State<LiquidScaffold> {
  LiquidSoftService _liquidService = LiquidSoftService();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _liquidService.getPlatformType == PlatformType.iOS
        ? CupertinoTabScaffold(
            key: widget.key,
            tabBar: CupertinoTabBar(
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Theme.of(context).primaryColorLight,
              items: widget.items[_currentTabIndex].actions
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Icon(
                        e.buttonIcon,
                        color: Theme.of(context).accentColor,
                      ),
                      label: e.title,
                    ),
                  )
                  .toList(),
            ),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(
                builder: (BuildContext context) => widget.items[_currentTabIndex].screen,
              );
            },
          )
        : Scaffold(
            body: SafeArea(
              top: false,
              child: LiquidAppBar(
                  key: widget.key,
                  title: widget.items[_currentTabIndex].title,
                  screen: widget.items[_currentTabIndex].screen,
                  appBarTrailing: widget.items[_currentTabIndex].appBarTrailing,
                  actions: widget.items[_currentTabIndex].actions),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Theme.of(context).accentColor,
              unselectedItemColor: Theme.of(context).primaryColorLight,
              elevation: 16,
              onTap: (val) {
                setState(
                  () {
                    _currentTabIndex = val;
                  },
                );
              }, // new
              currentIndex: _currentTabIndex, // new
              items: widget.items[_currentTabIndex].actions
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Icon(
                        e.buttonIcon,
                        color: Theme.of(context).accentColor,
                      ),
                      label: e.title,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
