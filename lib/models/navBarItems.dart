import 'package:flutter/material.dart';

import 'actionButton.dart';

class NavBarItems {
  /// title - this will show up on the top of the cupertino appBar and under the navBar item
  final String title;

  /// this is the icon that will show up in the navBar
  final IconData navIcon;

  /// the widget to show when the navBar item is clicked
  final Widget screen;

  /// this is the space on the end of the navBar
  /// this is usually a settings icon or notificaitons button
  ///
  final Widget appBarTrailing;

  /// for material this will be a floating action button
  /// for cupertino, this will be a Icons.add in the navBar
  final List<ActionButton> actions;

  NavBarItems(
      {required this.title,
      required this.navIcon,
      required this.screen,
      required this.appBarTrailing,
      required this.actions});
}
