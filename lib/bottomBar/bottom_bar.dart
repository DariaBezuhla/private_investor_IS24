import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:provider/provider.dart';

import '../home.dart';
import '../settings.dart';
import '../theme.dart';
import '../wishlist.dart';

class BottomBar extends StatefulWidget {
  final selectedIndex;
  BottomBar({Key key, this.selectedIndex}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final _pageOptions = [
    Home(),
    WishlistScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).push(
      PageRouteGenerator(builder: (context) {
        return _pageOptions[_selectedIndex];
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getDisplayTheme(context);

    //var colorBottom =(widget.theme == 'Dark') ? dHeaderFooter : kBackgroundLight;
    //var hightOfSafeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Material(
      elevation: ScreenUtil().setWidth(16),
      child: Container(
        //height: bottomHeight,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          backgroundColor: theme.bottomAppBarColor,
          currentIndex: widget.selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              title:
                  Padding(padding: EdgeInsets.all(0)), //Container(height: 0.0),
              icon: Icon(
                SystemIconsIS.is24_system_48px_search,
                size: ScreenUtil()
                    .setWidth(24), //MediaQuery.of(context).size.width * 0.09,
                color: theme.iconTheme.color,
              ),
              activeIcon:
                  new Image.asset("assets/images/search@3x_2.png", height: 26),
            ),
            BottomNavigationBarItem(
              title:
                  Padding(padding: EdgeInsets.all(0)), //Container(height: 0.0),
              icon: Icon(
                SystemIconsIS.is24_system_48px_heart_favorite,
                size: ScreenUtil()
                    .setWidth(24), //MediaQuery.of(context).size.width * 0.09,
                color: theme.iconTheme.color,
              ),
              activeIcon:
                  new Image.asset("assets/images/heart@3x_2.png", height: 26),
            ),
            BottomNavigationBarItem(
              title:
                  Padding(padding: EdgeInsets.all(0)), //Container(height: 0.0),
              icon: Icon(
                SystemIconsIS.is24_system_48px_settings,
                size: ScreenUtil()
                    .setWidth(24), //MediaQuery.of(context).size.width * 0.09,
                color: theme.iconTheme.color,
              ),
              activeIcon: new Image.asset("assets/images/settings@3x_2.png",
                  height: 26),
            ),
          ],
        ),
      ),
    );
  }
}
