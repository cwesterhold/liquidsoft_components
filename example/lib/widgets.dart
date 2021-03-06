import 'package:example/spinnerPage.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({Key? key}) : super(key: key);

  @override
  _WidgetsScreenState createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  LiquidSoftService _liquidSoftService = LiquidSoftService();
  final expenseDateController = TextEditingController();
  final messageController = TextEditingController();
  final expenseAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 8),
            child:
                Text('Here are examples of all of the widgets in the library'),
          ),
          Text('The App Bar and Bottom Nav Bar are LiquidScaffold'),
          LiquidHeader(labelText: 'Liquid Date Picker'),
          LiquidDate(
            fieldName: 'Expense Date',
            labelText: 'Expense Date',
            fieldWidth: MediaQuery.of(context).size.width * .85,
            isEdit: true,
            validator: (val) {
              var returnVal;

              if (val == null) {
                returnVal = 'Date must not be null';
              } else if (DateTime.parse(val).difference(DateTime.now()).inDays <
                  0) {
                returnVal = 'Date Must be today or after';
              } else {
                returnVal = null;
              }

              return returnVal;
            },
            controller: expenseDateController,
            onSaved: (newVal) {
              print('do something on form submission');
            },
            onChanged: (newVal) {
              print('do something when the field is changed');
            },
          ),
          LiquidHeader(labelText: 'Liquid Dropdown'),
          LiquidDropdown(
            fieldName: "Expense Frequency",
            labelText: 'Expense Frequency',
            fieldWidth: MediaQuery.of(context).size.width * .85,
            initValue: 'Weekly',
            values: [
              'Weekly',
              'Every other Week',
              'Monthly',
              'Quarterly',
              'Yearly'
            ],
            onChanged: (val) {
              print(val);
            },
            onSaved: (val) {
              print(val);
            },
            isEdit: true,
          ),
          LiquidHeader(labelText: 'Liquid Multi-Text'),
          LiquidMultiText(
            fieldName: "Message",
            labelText: "Tell us your thoughts?",
            isEdit: true,
            fieldWidth: MediaQuery.of(context).size.width * .85,
            keyboardType: TextInputType.text,
            validator: (val) {},
            maxLines: 4,
            controller: messageController,
            onChanged: (val) {
              print(val);
            },
            onSaved: (val) {
              print(val);
            },
          ),
          LiquidHeader(labelText: 'Liquid Text'),
          LiquidText(
            fieldName: 'Expense Amount',
            labelText: 'Expense Amount',
            fieldWidth: MediaQuery.of(context).size.width * .85,
            keyboardType: TextInputType.number,
            isEdit: true,
            validator: (val) {
              if (val == null) {
                return "Expense Frequency Amount cannot be empty";
              } else if (double.parse(val.replaceAll(",", "")) == 0) {
                return "Please enter a valid number";
              } else {
                return null;
              }
            },
            controller: expenseAmountController,
            onChanged: (newVal) {
              print(newVal);
            },
            onSaved: (newVal) {
              print(newVal);
            },
          ),
          LiquidHeader(labelText: 'Liquid Switch'),
          LiquidSwitch(
            labelText: 'Liquid Switch',
            fieldWidth: MediaQuery.of(context).size.width * .85,
            value: true,
            onChanged: (value) {
              print(value);
            },
            trackColor: Theme.of(context).accentColor,
            activeColor: Theme.of(context).primaryColor,
          ),
          LiquidHeader(labelText: 'Liquid Search'),
          LiquidSearch(
              fieldName: "Search",
              fieldWidth: MediaQuery.of(context).size.width * .85,
              labelText: "Search",
              fieldHeight: 40,
              suffixIcon: Icon(Icons.search),
              onChanged: (value) {
                print(value);
              }),
          LiquidHeader(labelText: 'Liquid Logo'),
          LiquidLogo(),
          LiquidHeader(labelText: 'Liquid Spinner'),
          LiquidButton(
            name: 'Route to Spinner Page',
            onPressed: () {
              _liquidSoftService.routePage(context, SpinnerPage());
            },
          ),
          LiquidHeader(labelText: 'Liquid Button'),
          Padding(
            padding: const EdgeInsets.only(bottom: 68.0),
            child: LiquidButton(
              name: 'Open Dialog',
              onPressed: () {
                _liquidSoftService.openDialog('Liquid Dialog',
                    'This opened a dialog based on the platform');
              },
            ),
          ),
        ],
      ),
    );
  }
}
