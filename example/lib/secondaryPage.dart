import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class SecondaryPage extends StatefulWidget {
  const SecondaryPage({Key? key}) : super(key: key);

  @override
  _SecondaryPageState createState() => _SecondaryPageState();
}

class _SecondaryPageState extends State<SecondaryPage> {
  LiquidSoftService _liquidSoftService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: LiquidSecondaryAppBar(
          title: "Expense Detail",
          trailing: GestureDetector(
            onTap: () {
              _liquidSoftService.approvalDialog(
                'Approval Dialog',
                'Please approve this ask',
                'Approve',
                'Deny',
                () {
                  print('I was approved');
                },
              );
            },
            child: Icon(
              Icons.delete,
              size: 24,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  ' This is a secondary page.  Use the LiquidSecondaryAppBar widget to get the appbar above.'),
              Divider(),
              Text(
                  'Click on the delete icon in the appBar to get an approval dialog')
            ],
          ),
        ),
      ),
    );
  }
}
