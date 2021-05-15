import 'package:example/appMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:liquidsoft_components/liquid_components.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  /// Bring in the component for initialization
  LiquidSoftComponents _liquidComponents = LiquidSoftComponents();

  /// this key is used across the components
  /// Use this key in the Material or Cupertino App
  GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  /// get the services
  LiquidSoftService _liquidSoftService = LiquidSoftService();

  /// Some of the components will use Theme.of to set the colors
  /// Make sure to the theme set or you will get component errors
  final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: HexColor('#FFCD38'),
    primaryColorDark: HexColor('#AE7849'),
    primaryColorLight: Colors.black12,
    accentColor: Colors.black54,
    backgroundColor: HexColor('#fafafa'),
    fontFamily: 'Comfortaa',
  );
  bool isDebug = false;

  @override
  void initState() {
    // change isDebug to true if in dev
    assert(isDebug = true);

    //init liquidsoft components
    _liquidComponents.initState(
        httpHeaders: {
          "Access-Control-Allow-Origin": '*',
          "accept": "application/json",
          "content-type": "application/json",
        },
        globalNavigatorKey: navigatorKey,
        isDebug: isDebug,
        logoLocationLight: 'assets/lightLogo.png',
        logoLocationDark: 'assets/darkLogo.png');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _liquidSoftService.getPlatformType == PlatformType.iOS
        ? Theme(
            data: light,
            child: CupertinoApp(
              theme: CupertinoThemeData(
                brightness: Brightness.light,
                primaryColor: Theme.of(context).primaryColor,
                primaryContrastingColor: Theme.of(context).accentColor,
              ),
              navigatorKey: navigatorKey,
              home: AppMainScreen(),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', ''), // English, no country code
              ],
            ),
          )
        : MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: "LiquidSoft Component Example App",
            theme: light,
            home: AppMainScreen(),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''), // English, no country code
            ],
          );
  }
}
