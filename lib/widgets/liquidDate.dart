import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// Returns a Material Datepicker or a Cupertino date wheel based on platform

class LiquidDate extends StatelessWidget {
  /// the unique field name
  final String fieldName;

  /// the label to be shown on the text field
  final String labelText;

  /// validator of the textfield
  /// (e) { if(e == null) return 'Field can't be blank'  }
  final String? Function(String?)? validator;

  /// textfield controller
  final TextEditingController controller;

  /// onSaved Function
  final Function(String?)? onSaved;

  /// onChanged Function
  final Function(String?)? onChanged;

  ///Width of the field
  final double fieldWidth;

  /// is the field editable
  final bool isEdit;

  /// optional key
  final Key? key;

  /// optional Border
  final OutlineInputBorder? border;

  LiquidDate(
      {required this.fieldName,
      required this.labelText,
      required this.fieldWidth,
      required this.validator,
      required this.controller,
      required this.onSaved,
      required this.onChanged,
      required this.isEdit,
      this.border,
      this.key});

  @override
  Widget build(BuildContext context) {
    LiquidSoftService _liquidService = LiquidSoftService();

    return _liquidService.getPlatformType == PlatformType.iOS
        ? CupertinoFormSection(
            backgroundColor: Colors.white,
            children: [
              CupertinoFormRow(
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    labelText,
                    style:
                        TextStyle(fontSize: 17, fontFamily: 'San Francisco', color: Colors.black54),
                  ),
                ),
                child: CupertinoTextField(
                  key: key,
                  enabled: isEdit ? true : false,
                  readOnly: isEdit ? false : true,
                  placeholder: labelText,
                  style: TextStyle(
                    fontFamily: "Comfortaa",
                  ),
                  //validator: validator,
                  controller: controller,
                  onSubmitted: onSaved,
                  onChanged: onChanged,
                  onTap: () async {
                    DateTime? date = DateTime(2020);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        DateTime? tempPickedDate;
                        return Container(
                          height: 250,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CupertinoButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    CupertinoButton(
                                      child: Text('Done'),
                                      onPressed: () {
                                        Navigator.of(context).pop(tempPickedDate);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 0,
                                thickness: 1,
                              ),
                              Expanded(
                                child: Container(
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    onDateTimeChanged: (DateTime dateTime) {
                                      tempPickedDate = dateTime;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    if (date != null) controller.text = DateFormat('yyyy-MM-dd').format(date);
                  },
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              width: fieldWidth,
              child: TextFormField(
                key: key,
                enabled: isEdit ? true : false,
                readOnly: isEdit ? false : true,
                decoration: InputDecoration(
                  labelText: labelText,
                  fillColor: Colors.white,
                  border: border,
                ),
                style: TextStyle(
                  fontFamily: "Comfortaa",
                ),
                validator: validator,
                controller: controller,
                onSaved: onSaved,
                onChanged: onChanged,
                onTap: () async {
                  DateTime? date = DateTime(2020);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                    context: context,
                    initialDate:
                        controller.text == '' ? DateTime.now() : DateTime.parse(controller.text),
                    firstDate: date,
                    lastDate: DateTime(2100),
                  );
                  if (date != null) controller.text = DateFormat('yyyy-MM-dd').format(date);
                },
              ),
            ),
          );
  }
}
