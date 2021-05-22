import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// Returns a Material spinner or a Cupertino spinner based on platform

class LiquidSwitch extends StatefulWidget {
  /// text field label text
  final String labelText;

  /// The true/false value of the switch
  final bool value;

  ///width of the textifeld
  final double fieldWidth;

  /// color of the track
  final Color? trackColor;

  final Color? activeColor;

  /// on Changed Function
  final Function(dynamic) onChanged;

  ///optional Key
  final Key? key;

  LiquidSwitch(
      {required this.labelText,
      required this.value,
      required this.onChanged,
      required this.fieldWidth,
      this.trackColor,
      this.activeColor,
      this.key});

  @override
  _LiquidSwitchState createState() => _LiquidSwitchState();
}

class _LiquidSwitchState extends State<LiquidSwitch> {
  LiquidSoftService _liquidService = LiquidSoftService();
  late bool _switchValue;

  @override
  void initState() {
    _switchValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _liquidService.getPlatformType == PlatformType.iOS
        ? CupertinoFormSection(
            backgroundColor: Colors.white,
            children: [
              CupertinoFormRow(
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    widget.labelText,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 17, fontFamily: 'San Francisco', color: Colors.black54),
                  ),
                ),
                child: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (val) {
                    setState(
                      () {
                        _switchValue = val;
                        widget.onChanged(val);
                      },
                    );
                  },
                  trackColor:
                      widget.trackColor == null ? Theme.of(context).accentColor : widget.trackColor,
                  activeColor: widget.activeColor == null
                      ? Theme.of(context).primaryColor
                      : widget.activeColor,
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: widget.fieldWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(widget.labelText),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _switchValue = !_switchValue;
                        });
                      },
                      child: Switch(
                        value: _switchValue,
                        onChanged: (val) {
                          setState(() {
                            _switchValue = val;
                            widget.onChanged(val);
                          });
                        },
                        activeTrackColor: widget.trackColor == null
                            ? Theme.of(context).accentColor
                            : widget.trackColor,
                        activeColor: widget.activeColor == null
                            ? Theme.of(context).primaryColor
                            : widget.activeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
