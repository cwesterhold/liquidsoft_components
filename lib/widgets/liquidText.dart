import 'package:flutter/material.dart';

/// Returns styled text field

class LiquidText extends StatelessWidget {
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
      this.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: fieldWidth,
        height: fieldHeight,
        child: TextFormField(
          key: key,
          enabled: isEdit ? true : false,
          readOnly: isEdit ? false : true,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            labelText: labelText,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          focusNode: focusNode,
          validator: validator,
          controller: controller,
          onSaved: onSaved,
          onChanged: onChanged,
          onTap: onTap,
          keyboardType: keyboardType,
          style: new TextStyle(
            fontFamily: "Comfortaa",
          ),
        ),
      ),
    );
  }
}
