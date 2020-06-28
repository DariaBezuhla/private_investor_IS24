import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../results.dart';
import '../theme.dart';

//AppBarSliverSmall for Wishlist -> IMPORTANT:  iconArrowLeft.onPressed: () return ResultScreen();
//Otherwise we can have vicious circle Wishlist <-> Expose
class AppBarSliverSmall extends StatelessWidget {
  const AppBarSliverSmall({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    final double statusBarHeight =
        56; //<-- NOT ScreenUtil().setWidth(24), It must be const 56.0
    var iconSize = MediaQuery.of(context).size.height > 1300.0
        ? 45.0
        : ScreenUtil().setWidth(24);
    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: iconSize,
          color: theme.iconTheme.color,
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteGenerator(builder: (context) {
              return ResultScreen();
            }),
          );
        });

    return SliverAppBar(
      leading:  new Container(),//iconArrowLeft,
      title: Center(child: themeProvider.getTheme() == dark ? dLogo : logo),
      actions: <Widget>[
        Container(
          width: 56,
        ),
      ],
      pinned: false,
      floating: true,
      expandedHeight: statusBarHeight,
      backgroundColor: theme.appBarTheme.color,
      elevation: elevation,
    );
  }
}
