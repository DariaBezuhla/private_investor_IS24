import 'package:flutter/material.dart';
import '../constant.dart';
import '../appBar/app_bar_with_ArrowLeft.dart';
import '../bottomBar/bottom_bar.dart';
import 'terms_and_condition_page_content.dart';

class TermsAndConditionPage extends StatefulWidget {
  final String theme;
  final int selectedIndex;

  const TermsAndConditionPage({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _TermsAndConditionPageState createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: TermsAndConditionPageContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
