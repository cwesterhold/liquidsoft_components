import 'package:flutter/material.dart';

class ActionButton {
  final String title;
  final IconData buttonIcon;
  final Function callBack;

  ActionButton(
      {required this.title, required this.buttonIcon, required this.callBack});
}
