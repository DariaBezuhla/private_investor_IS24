import 'package:flutter/material.dart';

import '../appBar/app_bar_with_ArrowLeft.dart';
import '../bottomBar/bottom_bar.dart';
import 'language_selection_content.dart';

class LanguageSelection extends StatefulWidget {
  final ThemeData theme;
  final int selectedIndex;

  const LanguageSelection({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: LanguageSelectionContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
      ),
    );
  }
}
