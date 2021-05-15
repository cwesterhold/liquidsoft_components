import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({Key? key}) : super(key: key);

  @override
  _SpinnerPageState createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: LiquidSecondaryAppBar(
          title: "Spinner Example",
        ),
        body: LiquidSpinner(
          title: 'Loading Content',
        ),
      ),
    );
  }
}
