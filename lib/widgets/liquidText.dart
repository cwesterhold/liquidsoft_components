import 'package:flutter/material.dart';

class LiquidText extends StatelessWidget {
  final String fieldName;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(dynamic)? onSaved;
  final Function(dynamic)? onChanged;
  final TextInputType keyboardType;
  final double fieldWidth;
  final double fieldHeight;
  final bool isEdit;
  final Function()? onTap;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final FocusNode? focusNode;

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
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: fieldWidth,
        height: fieldHeight,
        child: TextFormField(
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
