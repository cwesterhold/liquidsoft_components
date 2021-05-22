import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

class LiquidMultiText extends StatefulWidget {
  /// unique field name
  final String fieldName;

  /// text field label text
  final String labelText;

  /// validator of the textfield
  /// (e) { if(e == null) return 'Field can't be blank'  }
  final String? Function(String?)? validator;

  /// textfield controller
  final TextEditingController? controller;

  /// onSaved function
  final Function(dynamic)? onSaved;

  /// on Changed Function
  final Function(dynamic)? onChanged;

  /// the keyboard type that will pop up on focus
  ///TextInputType = text,multiline,number,phone, datetime,email address,url
  final TextInputType keyboardType;

  ///width of the textifeld
  final double fieldWidth;

  /// number of lines the textfield will contain before scrolling
  final int maxLines;

  /// is the field editable
  /// if set to false, the field will be greyed out
  final bool isEdit;

  /// onTap function
  /// This can be very helpful if you are trying to open a date or time picker
  final Function()? onTap;

  /// optional Border
  final OutlineInputBorder? border;

  ///optional key
  final Key? key;

  LiquidMultiText(
      {required this.fieldName,
      required this.labelText,
      required this.fieldWidth,
      required this.maxLines,
      required this.keyboardType,
      this.validator,
      this.controller,
      this.onSaved,
      this.onChanged,
      this.onTap,
      required this.isEdit,
      this.border,
      this.key});

  @override
  _LiquidMultiTextState createState() => _LiquidMultiTextState();
}

class _LiquidMultiTextState extends State<LiquidMultiText> {
  LiquidSoftService _liquidService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: _liquidService.getPlatformType == PlatformType.iOS
          ? CupertinoFormSection(
              backgroundColor: Colors.white,
              children: [
                CupertinoFormRow(
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.labelText,
                      style: TextStyle(
                          fontSize: 17, fontFamily: 'San Francisco', color: Colors.black54),
                    ),
                  ),
                  child: CupertinoTextField(
                    key: widget.key,
                    enabled: widget.isEdit ? true : false,
                    readOnly: widget.isEdit ? false : true,
                    keyboardType: widget.keyboardType,
                    maxLines: widget.maxLines,
                    placeholder: widget.labelText,
                    //validator: widget.validator,
                    controller: widget.controller,
                    onSubmitted: widget.onSaved,
                    onChanged: widget.onChanged,
                    onTap: widget.onTap,
                    style: new TextStyle(
                      fontFamily: "Comfortaa",
                    ),
                  ),
                ),
              ],
            )
          : Container(
              width: widget.fieldWidth,
              child: TextFormField(
                key: widget.key,
                enabled: widget.isEdit ? true : false,
                readOnly: widget.isEdit ? false : true,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxLines,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  fillColor: Colors.white,
                  border: widget.border,
                ),
                validator: widget.validator,
                controller: widget.controller,
                onSaved: widget.onSaved,
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                style: new TextStyle(
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
    );
  }
}
