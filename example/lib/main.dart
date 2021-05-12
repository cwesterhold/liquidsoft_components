import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  LiquidSoftComponents _liquidComponents = LiquidSoftComponents();

  @override
  void initState() {
    _liquidComponents.initState(
        httpHeaders: {
          "Authorization": "08022020-LiquidSoft",
          "Access-Control-Allow-Origin": '*',
          "accept": "application/json",
          "content-type": "application/json",
        },
        isDebug: false,
        logoLocationLight: 'assets/fixerr.png',
        logoLocationDark: 'assets/fixerrWhite.png');

    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      title: "LiquidSoft Component Example App",
      theme: light,
      home: SingleChildScrollView(
        child: Column(
          children: [
            Text('Below is a Header, centered with accent color'),
            LiquidHeader(labelText: ''),
          ],
        ),
      ),
    );
  }
}
