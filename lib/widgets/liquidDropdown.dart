import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// Returns a Material Dropdown or a Cupertino picker wheel based on platform

class LiquidDropdown extends StatefulWidget {
  /// unique field name
  final String fieldName;

  /// label text for textfield
  final String labelText;

  /// initial dropdown value
  final String initValue;

  /// on saved function
  final Function(dynamic)? onSaved;

  /// onChanged function
  final Function(dynamic)? onChanged;

  /// width of the textfield
  final double fieldWidth;

  /// is the field editable
  final bool isEdit;

  /// list of the dropdown boxes
  /// [apples,oranges,pears]
  final List<String> values;

  /// optional Border
  final OutlineInputBorder? border;

  /// optional key
  final Key? key;

  LiquidDropdown(
      {required this.fieldName,
      required this.labelText,
      required this.initValue,
      required this.fieldWidth,
      required this.values,
      this.onSaved,
      this.onChanged,
      required this.isEdit,
      this.border,
      this.key});

  @override
  _LiquidDropdownState createState() => _LiquidDropdownState();
}

class _LiquidDropdownState extends State<LiquidDropdown> {
  var _dropVal;
  var _labelText;
  var _onSaved;
  var _onChanged;
  var _fieldWidth;
  List<String> _values = [];
  var _isEdit;
  int _initValIndex = 0;
  final cupDropController = TextEditingController();
  LiquidSoftService _liquidService = LiquidSoftService();

  @override
  void initState() {
    super.initState();
    _labelText = widget.labelText;
    _onSaved = widget.onSaved;
    _onChanged = widget.onChanged;
    _fieldWidth = widget.fieldWidth;
    _values = widget.values;
    _isEdit = widget.isEdit;

    if (_isEdit == false) {
      _values = [];
    }

    _dropVal = widget.initValue;

    cupDropController.text = _dropVal;

    cupDropController.addListener(() {
      _onChanged(cupDropController.text);
    });
  }

  List<DropdownMenuItem<dynamic>> _getItems() {
    var x = _values
        .map<DropdownMenuItem<dynamic>>(
          (val) => DropdownMenuItem(
            value: val,
            child: Text(val),
          ),
        )
        .toList();

    return x;
  }

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
                    enabled: _isEdit ? true : false,
                    readOnly: _isEdit ? false : true,
                    focusNode: AlwaysDisabledFocusNode(),
                    style: TextStyle(
                      fontFamily: "Comfortaa",
                    ),
                    onSubmitted: _onSaved,
                    onChanged: _onChanged,
                    controller: cupDropController,
                    onTap: () async {
                      setState(() {
                        _initValIndex = _values.indexOf(_dropVal);
                      });

                      var t = await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String? tempText;
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
                                          Navigator.of(context).pop(tempText);
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
                                    child: CupertinoPicker(
                                      backgroundColor: Colors.white,
                                      itemExtent: 40,
                                      looping: false,
                                      scrollController:
                                          FixedExtentScrollController(initialItem: _initValIndex),
                                      children: _values
                                          .map(
                                            (e) => Text(e),
                                          )
                                          .toList(),
                                      onSelectedItemChanged: (val) {
                                        tempText = _values[val];
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      cupDropController.text = t;
                      _dropVal = t;
                    },
                  ),
                ),
              ],
            )
          : Container(
              width: _fieldWidth,
              child: DropdownButtonFormField(
                key: widget.key,
                items: _getItems(),
                onChanged: _onChanged,
                onSaved: _onSaved,
                value: _dropVal,
                decoration: InputDecoration(
                  labelText: _labelText,
                  fillColor: Colors.white,
                  border: widget.border,
                ),
              ),
            ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
