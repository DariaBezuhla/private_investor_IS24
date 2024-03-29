import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../theme.dart';
import '../wishlist.dart';

//AppBar for Expose
class AppBarForExpose extends StatelessWidget implements PreferredSizeWidget {
  int fromPage =
      0; //shows, from what page ( WishlistScreen()-1 or ResultScreen()-0) we come to Expose()
  // 0 -> return to  WishlistScreen(),
  // 1 -> return to  ResultScreen(),
  String houseId;
  AppBarForExpose({
    Key key,
    this.fromPage,
    this.houseId,
  }) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(
      56.0); //<-- NOT ScreenUtil().setWidth(24), It must be const 56.0

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    var iconSize = MediaQuery.of(context).size.height > 1300.0
        ? 45.0
        : ScreenUtil().setWidth(24);

    //back to previous page with Hero transition
    void back() {
      Navigator.of(context).pop(true);
    }

    void toWishlist() {
      //if object was removed from favorites -> return to new WishlistScreen(), without Hero transition
      if (!Favorites.savedFavorites.contains(houseId)) {
        Navigator.of(context).push(
          PageRouteGenerator(builder: (context) {
            return WishlistScreen();
          }),
        );
      }
      //if object still in favorites -> return tщ previous WishlistScreen() with Hero transition
      else
        back();
    }

    var iconArrowLeft = IconButton(
        icon: Icon(SystemIconsIS.is24_system_48px_chevron_left,
            size: iconSize, color: theme.iconTheme.color),
        onPressed: fromPage == 1 ? toWishlist : back);

    return AppBar(
      leading: iconArrowLeft,
      title: Center(child: themeProvider.getTheme() == dark ? dLogo : logo),
      backgroundColor: theme.appBarTheme.color,
      elevation: elevation,
      actions: <Widget>[
        new Container(
          width: 56,
          //height: 56,
        ),
      ],
    );
  }
}
