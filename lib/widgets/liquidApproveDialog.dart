import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_components/services/liquidServices.dart';
import 'package:liquid_components/services/platformInfo.dart';

class LiquidApproveDialog extends StatefulWidget {
  final String title;
  final String text;
  final String approveText;
  final String denyText;

  LiquidApproveDialog(
      {required this.title,
      required this.text,
      this.approveText = 'Approve',
      this.denyText = 'Deny'});

  @override
  _LiquidApproveDialogState createState() => _LiquidApproveDialogState();
}

class _LiquidApproveDialogState extends State<LiquidApproveDialog> {
  late String _title;
  late String _text;
  late String _approveText;
  late String _denyText;

  @override
  void initState() {
    _title = widget.title;
    _text = widget.text;
    _approveText = widget.approveText;
    _denyText = widget.denyText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LiquidService _liquidService = LiquidService();

    return _SystemPadding(
      child: _liquidService.getPlatformType == PlatformType.iOS
          ? CupertinoAlertDialog(
              title: Text(
                _title,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18.0,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Text(
                      _text,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: FlatButton(
                    child: Text(_denyText),
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                  ),
                ),
                CupertinoDialogAction(
                  child: FlatButton(
                    child: Text(_approveText),
                    onPressed: () {
                      Navigator.pop(context, 'Approve');
                    },
                  ),
                )
              ],
            )
          : AlertDialog(
              title: Text(
                _title,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18.0,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Text(
                      _text,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                FlatButton(
                  child: Text(_denyText),
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                ),
                FlatButton(
                  child: Text(_approveText),
                  onPressed: () {
                    Navigator.pop(context, 'Approve');
                  },
                )
              ],
            ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({required this.child});

  @override
  Widget build(BuildContext context) {
    return new AnimatedContainer(duration: const Duration(milliseconds: 200), child: child);
  }
}
