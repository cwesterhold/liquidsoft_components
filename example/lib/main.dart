import 'package:example/appMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:liquidsoft_components/liquid_components.dart';

void main() {
  bool isDebug = false;
  assert(isDebug = true);

  /// initialize the components, error handling, and httpcaller
  LiquidSoftComponents(
    rootWidget: ExampleApp(),
    httpHeaders: {
      "Access-Control-Allow-Origin": '*',
      "accept": "application/json",
      "content-type": "application/json",
    },
    errorAdminEmail: 'chris@liquidsoft.io',
    isDebug: isDebug,
    logoLocationLight: 'assets/lightLogo.png',
    logoLocationDark: 'assets/darkLogo.png',
  );
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  /// get the services
  LiquidSoftService _liquidSoftService = LiquidSoftService();

  /// Some of the components will use Theme.of to set the colors based on Brightness.light or dark
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

              /// Make sure to add this key or error handling and any dialog/snackbars will not work
              navigatorKey: _liquidSoftService.navigatorKey,
              home: AppMainScreen(),

              /// The localizations are required for cupertino
              /// the text widgets need a Material ancestor
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
            /// Make sure to add this key or error handling and any dialog/snackbars will not work
            navigatorKey: _liquidSoftService.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: "LiquidSoft Component Example App",
            theme: light,
            home: AppMainScreen(),

            /// The localizations are required for cupertino
            /// the text widgets need a Material ancestor
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
