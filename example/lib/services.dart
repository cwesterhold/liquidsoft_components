import 'package:example/secondaryPage.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  LiquidSoftService _liquidSoftService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text('Here are examples of all of the widgets in the library'),
          ),
          Divider(),
          LiquidHeader(labelText: 'Liquid Errors'),
          LiquidSmallButton(
            name: 'HTTP Error',
            onPressed: () {
              _liquidSoftService.throwHTTPError('500', 'something didnt go right...');
            },
          ),
          LiquidSmallButton(
            name: 'Connectivity Error',
            onPressed: () {
              _liquidSoftService.throwConnectivityError();
            },
          ),
          LiquidSmallButton(
            name: 'General Error',
            onPressed: () {
              _liquidSoftService.catchError('something didnt go right...');
            },
          ),
          LiquidHeader(labelText: 'Liquid Routing'),
          LiquidSmallButton(
            name: 'Route to Secondary Page',
            onPressed: () {
              _liquidSoftService.routePage(context, SecondaryPage());
            },
          ),
          LiquidHeader(labelText: 'Liquid SnackBar'),
          LiquidSmallButton(
            name: 'Open SnackBar',
            onPressed: () {
              _liquidSoftService.showSnackBar(context, 'This is a liquid snackbar');
            },
          ),
          LiquidHeader(labelText: 'Liquid Dollar Formatting'),
          Text('Starting number - 4325564'),
          Text('Output - ${_liquidSoftService.getDollarFormat(4325564)}'),
          LiquidHeader(labelText: 'Liquid Number Formatting'),
          Text('Starting number - 124.584838382'),
          Text('Output - ${_liquidSoftService.numberFormat(124.584838382)}'),
          LiquidHeader(labelText: 'Liquid Approval Dialog'),
          LiquidSmallButton(
            name: 'Open Approval',
            onPressed: () {
              _liquidSoftService.approvalDialog(
                context,
                'Approval Dialog',
                'Please approve this ask',
                'Approve',
                'Deny',
                () {
                  print('I was approved');
                },
              );
            },
          ),
          LiquidHeader(labelText: 'Liquid Dialog'),
          Padding(
            padding: const EdgeInsets.only(bottom: 68.0),
            child: LiquidSmallButton(
              name: 'Open Dialog',
              onPressed: () {
                _liquidSoftService.openDialog(
                    context, 'Liquid Dialog', 'This opened a dialog based on the platform');
              },
            ),
          )
        ],
      ),
    );
  }
}
