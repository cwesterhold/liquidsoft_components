import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

class LiquidDate extends StatelessWidget {
  final String fieldName;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final double fieldWidth;
  final int maxLines;
  final bool isEdit;
  final Function()? onTap;
  final Key? key;

  LiquidDate(
      {required this.fieldName,
      required this.labelText,
      required this.fieldWidth,
      required this.maxLines,
      required this.validator,
      required this.controller,
      required this.onSaved,
      required this.onChanged,
      this.onTap,
      required this.isEdit,
      this.key});

  @override
  Widget build(BuildContext context) {
    LiquidSoftService _liquidService = LiquidSoftService();

    return Padding(
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          style: TextStyle(
            fontFamily: "Comfortaa",
          ),
          validator: validator,
          controller: controller,
          onSaved: onSaved,
          onChanged: onChanged,
          onTap: () async {
            DateTime date = DateTime(2020);
            FocusScope.of(context).requestFocus(new FocusNode());

            if (_liquidService.getPlatformType == PlatformType.iOS) {
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
              controller.text = DateFormat('yyyy-MM-dd').format(date);
            } else {
              date = (await showDatePicker(
                context: context,
                initialDate: DateTime.parse(controller.text),
                firstDate: date,
                lastDate: DateTime(2100),
              ))!;
              controller.text = DateFormat('yyyy-MM-dd').format(date);
            }
          },
        ),
      ),
    );
  }
}
