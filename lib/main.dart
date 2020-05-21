import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() => runApp(PrivateInvestors());

class PrivateInvestors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(light),
      child: Material(),
    );
  }
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getTheme(),
      title: 'ImmoScout Private Investors',
      home: Home(),
    );
  }
}
