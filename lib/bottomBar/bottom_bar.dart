import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../constant.dart';

class BottomBar extends StatefulWidget {
  final theme;

  BottomBar({Key key, this.theme}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorBottom = (widget.theme == 'Dark') ? dHeaderFooter : kBackgroundLight;
    var colorIcon = (widget.theme == 'Dark') ? dIconColor : kCharcoal;

    return Container(
      height: bottomHeight,
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: colorBottom,
        currentIndex: _currentIndex,
        onTap: (int _currentIndex) {
          setState(() {
            this._currentIndex = _currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            title:  Padding(padding: EdgeInsets.all(0)),//Container(height: 0.0),
            icon: Icon(
              SystemIconsIS.is24_system_48px_search,
              size: 24,//MediaQuery.of(context).size.width * 0.09,
              color: colorIcon,
            ),
            activeIcon: new Image.asset("assets/images/search@3x_2.png", height: 26),
          ),
          BottomNavigationBarItem(
            title:  Padding(padding: EdgeInsets.all(0)),//Container(height: 0.0),
            icon: Icon(
              SystemIconsIS.is24_system_48px_heart_favorite,
              size: 24,//MediaQuery.of(context).size.width * 0.09,
              color:colorIcon,
            ),
            activeIcon: new Image.asset("assets/images/heart@3x_2.png",height: 26),
          ),
          BottomNavigationBarItem(
            title:  Padding(padding: EdgeInsets.all(0)),//Container(height: 0.0),
            icon: Icon(
              SystemIconsIS.is24_system_48px_settings,
              size: 24,//MediaQuery.of(context).size.width * 0.09,
              color: colorIcon,
            ),
            activeIcon: new Image.asset("assets/images/settings@3x_2.png", height: 26),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
