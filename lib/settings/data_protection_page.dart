import 'package:flutter/material.dart';
import '../constant.dart';
import '../appBar/app_bar_with_ArrowLeft.dart';
import '../bottomBar/bottom_bar.dart';
import 'data_protection_page_content.dart';

class DataProtectionPage extends StatefulWidget {
  final String theme;
  final int selectedIndex;

  const DataProtectionPage({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _DataProtectionPageState createState() => _DataProtectionPageState();
}

class _DataProtectionPageState extends State<DataProtectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: DataProtectionPageContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
