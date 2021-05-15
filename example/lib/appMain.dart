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
  /// This will be passed to the LiquidScaffold
  late List<NavBarItems> _navBarItems = [];

  /// This is the services to call
  LiquidSoftService _liquidSoftService = LiquidSoftService();

  /// Show the spinner when loading
  bool _loading = true;

  @override
  void initState() {
    ///create the widgets nav bar, appbar, and appBar trailing icon
    _navBarItems.add(
      NavBarItems(
        title: 'Widgets',
        navIcon: Icons.widgets,
        screen: WidgetsScreen(),
        appBarTrailing: GestureDetector(
          child: Icon(
            Icons.settings_backup_restore,
            size: 30,
          ),
          onTap: () {
            _liquidSoftService.openDialog(
                context, 'Liquid Dialog', 'This opened a dialog based on the platform');
          },
        ),
        actions: [
          ActionButton(
            title: 'New Something',
            buttonIcon: Icons.title,
            callBack: () {
              _liquidSoftService.showSnackBar(context, 'This is a liquid snackbar');
            },
          ),
        ],
      ),
    );

    ///create the services nav bar, appbar, and appBar trailing icon
    _navBarItems.add(
      NavBarItems(
        title: 'Services',
        navIcon: Icons.design_services,
        screen: ServicesScreen(),
        appBarTrailing: GestureDetector(
          child: Icon(
            Icons.supervised_user_circle,
            size: 30,
          ),
          onTap: () {
            _liquidSoftService.openDialog(
                context, 'Liquid Dialog', 'This opened a dialog based on the platform');
          },
        ),
        actions: [
          ActionButton(
            title: 'New Other Thing',
            buttonIcon: Icons.title,
            callBack: () {
              _liquidSoftService.showSnackBar(context, 'This is a liquid snackbar');
            },
          ),
        ],
      ),
    );

    ///create the services nav bar, appbar, and appBar trailing icon
    _navBarItems.add(
      NavBarItems(
        title: 'Other',
        navIcon: Icons.gesture,
        screen: OtherScreen(),
        appBarTrailing: GestureDetector(
          child: Icon(
            Icons.map,
            size: 30,
          ),
          onTap: () {
            _liquidSoftService.openDialog(
                context, 'Liquid Dialog', 'This opened a dialog based on the platform');
          },
        ),
        actions: [
          ActionButton(
            title: 'New Other Thing',
            buttonIcon: Icons.title,
            callBack: () {
              _liquidSoftService.showSnackBar(context, 'This is a liquid snackBar');
            },
          ),
        ],
      ),
    );

    Future.delayed(Duration(seconds: 3));
    _loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _loading
            ? LiquidSpinner(title: 'Loading Example')
            : LiquidScaffold(
                items: _navBarItems,
              ),
      ),
    );
  }
}
