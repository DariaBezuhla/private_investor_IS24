import 'package:flutter/material.dart';
import '../../results/card/view_states.dart';

class DetailsStyleContents extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isOverflow;
  final FontStyle fontStyle;
  final TextStyle textStyle;

  const DetailsStyleContents({
    Key key,
    this.text,
    this.fontSize,
    this.isOverflow,
    this.fontStyle,
    this.textStyle,
  }) : super(key: key);

  Widget _buildDetailsText() => Text(
        text,
        style: textStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: isOverflow
          ? OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: _buildDetailsText(),
            )
          : _buildDetailsText(),
    );
  }
}

class DetailsStyle extends StatefulWidget {
  final String title;
  final ViewState viewState;
  final double smallFontSize;
  final double largeFontSize;
  final bool isOverflow;
  final FontStyle fontStyle;
  final TextStyle textStyle;

  const DetailsStyle({
    Key key,
    @required this.title,
    @required this.viewState,
    this.smallFontSize = 15.0, //House Price size on Screen1
    this.largeFontSize = 25.0, //House Price on destination screen
    this.isOverflow = false,
    this.fontStyle = FontStyle.normal,
    @required this.textStyle,
  }) : super(key: key);

  @override
  _DetailsStyleState createState() => _DetailsStyleState();
}

class _DetailsStyleState extends State<DetailsStyle>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _fontSizeTween;
  double fontSize;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {
          fontSize = _fontSizeTween.value;
        });
      });

    switch (widget.viewState) {
      case ViewState.enlarge:
        _fontSizeTween = Tween<double>(
          begin: widget.smallFontSize,
          end: widget.largeFontSize,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

        _animationController.forward(from: 0.0);
        break;

      case ViewState.enlarged:
        fontSize = widget.largeFontSize;
        break;

      case ViewState.shrink:
        _fontSizeTween = Tween<double>(
          begin: widget.largeFontSize,
          end: widget.smallFontSize,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

        _animationController.forward(from: 0.0);
        break;

      case ViewState.shrunk:
        fontSize = widget.smallFontSize;
        break;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsStyleContents(
      text: widget.title,
      isOverflow: widget.isOverflow,
      fontStyle: widget.fontStyle,
      textStyle: widget.textStyle,
    );
  }
}
