import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/services/liquidServices.dart';
import 'package:liquidsoft_components/services/platformInfo.dart';

/// You can use this class directly but the suggestion would be to use the service instead
/// The service allows for callback function
/// LiquidSoftService.approvalDialog()

class LiquidApproveDialog extends StatefulWidget {
  final String title;
  final String text;
  final String approveText;
  final String denyText;
  final Key? key;

  LiquidApproveDialog(
      {required this.title,
      required this.text,
      this.approveText = 'Approve',
      this.denyText = 'Deny',
      this.key});

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
    LiquidSoftService _liquidService = LiquidSoftService();

    return _SystemPadding(
      child: _liquidService.getPlatformType == PlatformType.iOS
          ? CupertinoAlertDialog(
              key: widget.key,
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
                  child: TextButton(
                    child: Text(_denyText),
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                  ),
                ),
                CupertinoDialogAction(
                  child: TextButton(
                    child: Text(_approveText),
                    onPressed: () {
                      Navigator.pop(context, 'Approve');
                    },
                  ),
                )
              ],
            )
          : AlertDialog(
              key: widget.key,
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
                TextButton(
                  child: Text(_denyText),
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                ),
                TextButton(
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
