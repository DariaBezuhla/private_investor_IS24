import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../theme.dart';

//AppBar with icon ArrowLeft
class AppBarWithArrow extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithArrow({Key key}) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    var iconSize = MediaQuery.of(context).size.height > 1300.0
        ? 45.0
        : ScreenUtil().setWidth(24);
    var iconArrowLeft = IconButton(
        icon: Icon(SystemIconsIS.is24_system_48px_chevron_left,
            size: iconSize, color: theme.iconTheme.color),
        onPressed: () {
          Navigator.of(context).pop(true);
        });

    return AppBar(
      leading: iconArrowLeft,
      title: Center(child: themeProvider.getTheme() == dark ? dLogo : logo),
      backgroundColor: theme.appBarTheme.color,
      elevation: 2,
      actions: <Widget>[
        new Container(
          width: 56,
          //height: 56,
        ),
      ],
    );
  }
}
