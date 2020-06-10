import 'package:flutter/material.dart';
import './constant.dart';
import 'appBar/app_bar_with_ArrowLeft.dart';
import 'bottomBar/bottom_bar.dart';
import 'settings/settings_content.dart';

class SettingsScreen extends StatefulWidget {
  final String theme;
  final int selectedIndex;

  const SettingsScreen({
    Key key,
    this.theme,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithArrow(),
      body: SettingsContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
