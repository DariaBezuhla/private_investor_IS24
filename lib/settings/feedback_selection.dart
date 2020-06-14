import 'package:flutter/material.dart';
import '../constant.dart';
import '../appBar/app_bar_with_ArrowLeft.dart';
import '../bottomBar/bottom_bar.dart';
import 'feedback_selection_content.dart';

class FeedbackSelection extends StatefulWidget {
  final String theme;
  final int selectedIndex;

  const FeedbackSelection({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _FeedbackSelectionState createState() => _FeedbackSelectionState();
}

class _FeedbackSelectionState extends State<FeedbackSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: FeedbackSelectionContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
