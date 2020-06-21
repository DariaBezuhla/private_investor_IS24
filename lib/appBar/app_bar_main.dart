import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../theme.dart';

//AppBar without iconArrowLeft for Home()
class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    return new AppBar(
      title: Center(child: themeProvider.getTheme() == dark ? dLogo : logo),
      leading: new Container(),
      backgroundColor: theme.appBarTheme.color,
      elevation: elevation,
      actions: <Widget>[
        new Container(
          width: 56,
          height: 56,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(56);
}
