import 'package:flutter/material.dart';

import './constant.dart';
import 'bottomBar/bottom_bar.dart';
import 'icons/system_icons_i_s_icons.dart';
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
    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: 24,
          color: kCharcoal,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        });

    return Scaffold(
      appBar: AppBar(
        leading: iconArrowLeft,
        title: logo,
        backgroundColor: Colors.white,
      ),
      //backgroundColor: kBackgroundLight,
      body: SettingsContent(
        theme: widget.theme,
      ),
      bottomNavigationBar: SafeArea(child: BottomBar(selectedIndex: 2)),
    );
  }
}
