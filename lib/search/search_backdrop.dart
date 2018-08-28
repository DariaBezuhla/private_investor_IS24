import 'package:flutter/material.dart';

class SearchBackdrop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchBackdropState();
}

class SearchBackdropState extends State<SearchBackdrop>
    with SingleTickerProviderStateMixin<SearchBackdrop> {
  static const _PANEL_HEADER_HEIGHT = 32.0;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Backdrop"),
          leading: IconButton(
            onPressed: () {
              _controller.fling(
                velocity: _isPanelVisible ? -1.0 : 1.0,
              );
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller.view,
            ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: _buildStack,
          ),
        ),
      );

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      child: Stack(
        children: <Widget>[
          Center(
            child: Text("base"),
          ),
          PositionedTransition(
            rect: animation,
            child: Material(
              borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(16.0),
                topRight: const Radius.circular(16.0),
              ),
              elevation: 12.0,
              child: Column(
                children: <Widget>[
                  const Text("body"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _PANEL_HEADER_HEIGHT;
    final double bottom = -_PANEL_HEADER_HEIGHT;

    final Animation<double> animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    final Tween<RelativeRect> tween = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    );

    return tween.animate(animation);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
