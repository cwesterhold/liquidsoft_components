import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// Returns styled text field

class LiquidSearch extends StatefulWidget {
  /// unique field name
  final String fieldName;

  /// textfield label
  final String labelText;

  /// onSaved function
  final Function(dynamic)? onSaved;

  /// onChanged function
  final Function(dynamic)? onChanged;

  /// size of the field width
  final double fieldWidth;

  /// height of the textfield
  final double fieldHeight;

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

  LiquidSearch(
      {required this.fieldName,
      required this.labelText,
      required this.fieldWidth,
      this.fieldHeight = 65,
      this.onSaved,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.border,
      this.key});

  @override
  _LiquidSearchState createState() => _LiquidSearchState();
}

class _LiquidSearchState extends State<LiquidSearch> {
  LiquidSoftService _liquidService = LiquidSoftService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: _liquidService.getPlatformType == PlatformType.iOS
          ? Container(
              width: widget.fieldWidth,
              child: CupertinoSearchTextField(
                key: widget.key,
                suffixIcon: widget.suffixIcon == null
                    ? Icon(CupertinoIcons.xmark_circle_fill)
                    : widget.suffixIcon!,
                placeholder: widget.labelText,
                focusNode: widget.focusNode,
                onSubmitted: widget.onSaved,
                onChanged: widget.onChanged,
              ),
            )
          : Container(
              width: widget.fieldWidth,
              height: widget.fieldHeight,
              child: TextFormField(
                key: widget.key,
                decoration: InputDecoration(
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  labelText: widget.labelText,
                  fillColor: Colors.white,
                  border: widget.border,
                ),
                focusNode: widget.focusNode,
                onSaved: widget.onSaved,
                onChanged: widget.onChanged,
                style: new TextStyle(
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
    );
  }
}
