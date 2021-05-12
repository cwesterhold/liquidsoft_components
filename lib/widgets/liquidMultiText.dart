import 'package:flutter/material.dart';

class LiquidMultiText extends StatelessWidget {
  final String fieldName;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(dynamic)? onSaved;
  final Function(dynamic)? onChanged;
  final TextInputType keyboardType;
  final double fieldWidth;
  final int maxLines;
  final bool isEdit;
  final Function()? onTap;

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
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: fieldWidth,
        child: TextFormField(
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
