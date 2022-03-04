import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //bool isDark = prefs.getBool(themeKey) ?? false;
  //ThemeData theme = isDark ? dark : light;

  runApp(EasyLocalization(
    child: PrivateInvestors(
      theme: light,
    ),
    path: "assets/translations",
    saveLocale: true,
    supportedLocales: [Locale('de'), Locale('en')],
  ));
}

class PrivateInvestors extends StatelessWidget {
  final ThemeData theme;
  const PrivateInvestors({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(theme),
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Home(),
    );
  }
}
