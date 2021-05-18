import 'package:example/other.dart';
import 'package:example/services.dart';
import 'package:example/widgets.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({Key? key}) : super(key: key);

  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  /// This is the services to call
  LiquidSoftService _liquidSoftService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LiquidScaffold(
          items: [
            /// The navBar item and its attributes
            NavBarItems(
              title: 'Widgets',
              navIcon: Icons.widgets,
              screen: WidgetsScreen(),
              appBarTrailing: GestureDetector(
                child: Icon(
                  Icons.settings_backup_restore,
                  size: 30,
                  color: Theme.of(context).accentColor,
                ),
                onTap: () {
                  _liquidSoftService.openDialog(
                      'Liquid Dialog', 'This opened a dialog based on the platform');
                },
              ),
              actions: [
                ActionButton(
                  title: 'New Something',
                  buttonIcon: Icons.title,
                  callBack: () {
                    _liquidSoftService.showSnackBar('This is a liquid snackbar');
                  },
                ),
              ],
            ),

            /// second navBar item and its attributes
            NavBarItems(
              title: 'Services',
              navIcon: Icons.design_services,
              screen: ServicesScreen(),
              appBarTrailing: GestureDetector(
                child: Icon(
                  Icons.supervised_user_circle,
                  size: 30,
                  color: Theme.of(context).accentColor,
                ),
                onTap: () {
                  _liquidSoftService.openDialog(
                      'Liquid Dialog', 'This opened a dialog based on the platform');
                },
              ),
              actions: [
                ActionButton(
                  title: 'New Other Thing',
                  buttonIcon: Icons.title,
                  callBack: () {
                    _liquidSoftService.showSnackBar('This is a liquid snackbar');
                  },
                ),
              ],
            ),

            /// the third navBar item and its attributes
            NavBarItems(
              title: 'Other',
              navIcon: Icons.gesture,
              screen: OtherScreen(),
              appBarTrailing: GestureDetector(
                child: Icon(
                  Icons.map,
                  size: 30,
                  color: Theme.of(context).accentColor,
                ),
                onTap: () {
                  _liquidSoftService.openDialog(
                      'Liquid Dialog', 'This opened a dialog based on the platform');
                },
              ),
              actions: [
                ActionButton(
                  title: 'New Other Thing',
                  buttonIcon: Icons.title,
                  callBack: () {
                    _liquidSoftService.showSnackBar('This is a liquid snackBar');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
