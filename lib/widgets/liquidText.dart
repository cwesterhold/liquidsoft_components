import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// Returns styled text field

class LiquidText extends StatefulWidget {
  /// unique field name
  final String fieldName;

  /// textfield label
  final String labelText;

  /// validator of the textfield
  /// (e) { if(e == null) return 'Field can't be blank'  }
  final String? Function(String?)? validator;

  /// textfield controller
  final TextEditingController? controller;

  /// onSaved function
  final Function(dynamic)? onSaved;

  /// onChanged function
  final Function(dynamic)? onChanged;

  /// the keyboard type that will pop up on focus
  ///TextInputType = text,multiline,number,phone, datetime,email address,url
  final TextInputType keyboardType;

  /// size of the field width
  final double fieldWidth;

  /// height of the textfield
  final double fieldHeight;

  /// is the field editable
  /// if set to false, the field will be greyed out
  final bool isEdit;

  /// onTap function
  /// This can be very helpful if you are trying to open a date or time picker
  final Function()? onTap;

  /// Icon that can be shown on the left side of the field
  final Icon? suffixIcon;

  /// Icon that can be shown on the right side of the field
  final Icon? prefixIcon;

  /// focus node to listen for focus changes
  final FocusNode? focusNode;

  /// optional Border
  final OutlineInputBorder? border;

  ///optional key
  final Key? key;

  LiquidText(
      {required this.fieldName,
      required this.labelText,
      required this.fieldWidth,
      this.fieldHeight = 65,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.controller,
      this.onSaved,
      this.onChanged,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      required this.isEdit,
      this.border,
      this.key});

  @override
  _LiquidTextState createState() => _LiquidTextState();
}

class _LiquidTextState extends State<LiquidText> {
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
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17, fontFamily: 'San Francisco', color: Colors.black54),
                    ),
                  ),
                  child: CupertinoTextField(
                    key: widget.key,
                    enabled: widget.isEdit ? true : false,
                    readOnly: widget.isEdit ? false : true,
                    suffix: widget.suffixIcon,
                    prefix: widget.prefixIcon,
                    placeholder: widget.labelText,
                    focusNode: widget.focusNode,
                    controller: widget.controller,
                    onSubmitted: widget.onSaved,
                    onChanged: widget.onChanged,
                    onTap: widget.onTap,
                    keyboardType: widget.keyboardType,
                    style: new TextStyle(
                      fontFamily: "Comfortaa",
                    ),
                  ),
                ),
              ],
            )
          : Container(
              width: widget.fieldWidth,
              height: widget.fieldHeight,
              child: TextFormField(
                key: widget.key,
                enabled: widget.isEdit ? true : false,
                readOnly: widget.isEdit ? false : true,
                decoration: InputDecoration(
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  labelText: widget.labelText,
                  fillColor: Colors.white,
                  border: widget.border,
                ),
                focusNode: widget.focusNode,
                validator: widget.validator,
                controller: widget.controller,
                onSaved: widget.onSaved,
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                keyboardType: widget.keyboardType,
                style: new TextStyle(
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
    );
  }
}
