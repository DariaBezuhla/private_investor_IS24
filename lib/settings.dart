import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:provider/provider.dart';

import './constant.dart';
import 'appBar/app_bar_with_ArrowLeft.dart';
import 'bottomBar/bottom_bar.dart';
import 'settings/settings_content.dart';

class SettingsScreen extends StatefulWidget {
  final int selectedIndex;

  const SettingsScreen({
    Key key,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBarWithArrow(),
      body: SettingsContent(
        theme: theme,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 2,
        theme: light,
      ),
    );
  }
}
