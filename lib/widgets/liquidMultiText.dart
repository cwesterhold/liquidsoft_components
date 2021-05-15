import 'package:flutter/material.dart';

/// Returns a multi line text field

class LiquidMultiText extends StatelessWidget {
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
      this.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: fieldWidth,
        child: TextFormField(
          key: key,
          enabled: isEdit ? true : false,
          readOnly: isEdit ? false : true,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: labelText,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(),
            ),
          ),
          validator: validator,
          controller: controller,
          onSaved: onSaved,
          onChanged: onChanged,
          onTap: onTap,
          style: new TextStyle(
            fontFamily: "Comfortaa",
          ),
        ),
      ),
    );
  }
}
