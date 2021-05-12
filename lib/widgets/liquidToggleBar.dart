import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LiquidToggleBar extends StatefulWidget {
  final Color backgroundColor;
  final Color selectedTabColor;

  final Color tabColor;
  final Color selectedTextColor;
  final Color textColor;
  final List<String> tabsNames;
  final Function(int) onSelectionUpdated;

  final double borderRadius;
  final double height;
  final double fontSize;

  LiquidToggleBar(
      {required this.tabsNames,
      this.backgroundColor = Colors.grey,
      this.selectedTabColor = Colors.orangeAccent,
      this.tabColor = Colors.orange,
      this.selectedTextColor = Colors.white,
      this.textColor = Colors.white,
      required this.onSelectionUpdated,
      this.borderRadius = 12,
      this.height = 30,
      this.fontSize = 15});

  @override
  State<StatefulWidget> createState() {
    return _LiquidToggleBarState();
  }
}

class _LiquidToggleBarState extends State<LiquidToggleBar> {
  LinkedHashMap<String, bool> _hashMap = LinkedHashMap();
  int _selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0, viewportFraction: .6);
  bool _initAnimationOver = false;

  @override
  void initState() {
    _hashMap = LinkedHashMap.fromIterable(widget.tabsNames, value: (value) => value = false);
    _hashMap[widget.tabsNames[0]] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
          color: widget.backgroundColor,
          child: Container(
            height: widget.height,
            padding: EdgeInsets.all(4.0),
            child: PageView.builder(
              itemCount: widget.tabsNames.length,
              controller: _controller,
              onPageChanged: (int index) => {
                setState(
                  () => {
                    _selectedIndex = index,
                    if (_controller.hasClients)
                      {
                        _controller.animateToPage(_selectedIndex,
                            duration: Duration(milliseconds: 400), curve: Curves.ease),
                        _updateSelection(_selectedIndex)
                      }
                  },
                ),
              },
              itemBuilder: (context, index) {
                return Transform.scale(
                  scale: index == _selectedIndex ? 1.0 : 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _hashMap.values.elementAt(index)
                          ? widget.selectedTabColor
                          : widget.tabColor,
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => setState(() => _updateSelection(index)),
                        child: Text(
                          _hashMap.keys.elementAt(index),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: widget.fontSize,
                              color: _hashMap.values.elementAt(index)
                                  ? widget.selectedTextColor
                                  : widget.textColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  _updateSelection(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onSelectionUpdated(_selectedIndex);
      _hashMap.updateAll((label, selected) => selected = false);
      _hashMap[_hashMap.keys.elementAt(index)] = true;
    });
  }
}
