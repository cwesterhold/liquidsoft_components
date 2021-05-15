import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquidsoft_components/liquid_components.dart';
import 'package:liquidsoft_components/models/actionButton.dart';
import 'package:liquidsoft_components/widgets/floating_action_bubble.dart';

class LiquidAppBar extends StatefulWidget {
  /// provide a key for the scaffold
  final Key? key;

  /// for cupertino this will be the Large Title in the navBar
  /// This is ignored on material
  final String title;

  /// this is the space on the end of the navBar
  /// this is usually a settings icon or notificaitons button
  final Widget appBarTrailing;

  /// for material this will be a floating action button
  /// for cupertino, this will be a Icons.add in the navBar
  final List<ActionButton>? actions;

  /// the widget to show when the navBar item is clicked
  final Widget screen;

  LiquidAppBar({
    this.key,
    required this.title,
    this.appBarTrailing = const Text(''),
    this.actions,
    required this.screen,
  });

  @override
  _LiquidAppBarState createState() => _LiquidAppBarState();
}

class _LiquidAppBarState extends State<LiquidAppBar>
    with SingleTickerProviderStateMixin {
  LiquidSoftService _liquidService = LiquidSoftService();
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool _menuOpen = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _liquidService.getPlatformType == PlatformType.iOS
        ? Scaffold(
            key: widget.key,
            body: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text(widget.title),
                  leading: LiquidLogo(),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.actions != null)
                        GestureDetector(
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Theme.of(context).accentColor,
                          ),
                          onTap: () async {
                            return showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoActionSheet(
                                title: Text('${widget.title} Actions'),
                                actions: widget.actions!
                                    .map((e) => CupertinoActionSheetAction(
                                          child: Text(e.title),
                                          onPressed: e.callBack,
                                        ))
                                    .toList(),
                                cancelButton: CupertinoActionSheetAction(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      widget.appBarTrailing
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return widget.screen;
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ),
          )
        : widget.actions != null
            ? Scaffold(
                key: widget.key,
                appBar: AppBar(
                  backgroundColor: Theme.of(context).canvasColor,
                  automaticallyImplyLeading: false,
                  leadingWidth: 200,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: LiquidLogo(),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [widget.appBarTrailing],
                  ),
                ),
                body: widget.screen,
                floatingActionButton: FloatingActionBubble(
                  // Menu items
                  items: widget.actions!
                      .map(
                        (e) => Bubble(
                          title: e.title,
                          iconColor: Colors.white,
                          bubbleColor: Theme.of(context).accentColor,
                          icon: e.buttonIcon,
                          titleStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                          onPress: e.callBack,
                        ),
                      )
                      .toList(),
                  animation: _animation,
                  onPress: () => {
                    setState(() {
                      _menuOpen = !_menuOpen;
                    }),
                    _animationController.isCompleted
                        ? _animationController.reverse()
                        : _animationController.forward(),
                  },

                  iconColor: Colors.white,
                  iconData: _menuOpen == true ? Icons.close : Icons.add,
                  backGroundColor: Theme.of(context).primaryColor,
                ),
              )
            : Scaffold(
                key: widget.key,
                appBar: AppBar(
                  backgroundColor: Theme.of(context).canvasColor,
                  automaticallyImplyLeading: false,
                  leadingWidth: 200,
                  leading: LiquidLogo(),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [widget.appBarTrailing],
                  ),
                ),
                body: widget.screen,
              );
  }
}
