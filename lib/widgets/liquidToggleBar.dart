import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///Horizontal tab interface capable of handing any number of inputs. Easily customize colors with an easy to use set of attributes.
/// basic usage
/// List<dynamic> screenList = [
///     BudgetScreen(),
///     SpendingHabitsScreen(),
///   ];
///
///Column(
///         mainAxisSize: MainAxisSize.min,
///         children: [
///           Padding(
///             padding: const EdgeInsets.only(top: 8.0),
///             child: Container(
///               child: Padding(
///                 padding: EdgeInsets.symmetric(horizontal: 18),
///                 child: LiquidToggleBar(
///                   tabsNames: tabsNames,
///                   height: 35,
///                   backgroundColor: Theme.of(context).primaryColorLight,
///                   selectedTabColor: Theme.of(context).primaryColor,
///                   tabColor: Theme.of(context).accentColor,
///                   onSelectionUpdated: (index) => setState(() => currentIndex = index),
///                 ),
///               ),
///             ),
///           ),
///           Expanded(child: screenList[currentIndex]),
///         ],
///       )

class LiquidToggleBar extends StatefulWidget {
  ///The background color of the card holding tabs
  final Color backgroundColor;

  ///The background color of the active tab
  final Color selectedTabColor;

  ///The background color of any shown inactive tabs
  final Color tabColor;

  ///The text color of the active tab
  final Color selectedTextColor;

  ///The text color of the inactive tabs
  final Color textColor;

  ///The list of tab names
  final List<String> tabsNames;

  ///The callback function that gives the index
  final Function(int) onSelectionUpdated;

  /// The radius of the card holding the tabs
  final double borderRadius;

  /// height of the tabBar
  final double height;

  /// fontsize of all text
  final double fontSize;

  ///optional key
  final Key? key;

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
      this.fontSize = 15,
      this.key});

  @override
  State<StatefulWidget> createState() {
    return _LiquidToggleBarState();
  }
}

class _LiquidToggleBarState extends State<LiquidToggleBar> {
  LinkedHashMap<String, bool> _hashMap = LinkedHashMap();
  int _selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0, viewportFraction: .6);

  @override
  void initState() {
    _hashMap = LinkedHashMap.fromIterable(widget.tabsNames, value: (value) => value = false);
    _hashMap[widget.tabsNames[0]] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
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
