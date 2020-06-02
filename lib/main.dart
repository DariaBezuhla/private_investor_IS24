import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:privateinvestorsmobile/home.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';
import 'package:provider/provider.dart';

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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //loading list of favorites from device
    Favorites.loadList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getTheme(),
      title: 'ImmoScout Private Investors',
      home: Home(),
    );
  }
}
