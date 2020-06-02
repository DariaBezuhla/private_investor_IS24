import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../constant.dart';
import '../home.dart';
import '../wishlist.dart';
import '../settings.dart';

class BottomBar extends StatefulWidget {
  final theme;
  final selectedIndex;

  BottomBar({Key key, this.theme, this.selectedIndex}) : super(key: key);

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
    var colorBottom = (widget.theme == 'Dark') ? dHeaderFooter : kHeaderFooter;
    var colorIcon = (widget.theme == 'Dark') ? dIconColor : kIcon;
    var hightOfSafeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Material(
      elevation: 16.0,
     /* child: Padding(
        //Padding instead SafeArea -> we need this for top shadow
        padding: EdgeInsets.only(bottom: hightOfPadding), //27 is inner BottomNavigationBar bottom Padding
       */
      child:

    Container(
          //height: bottomHeight,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            backgroundColor: colorBottom,
            currentIndex: widget.selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                title:
                    Padding(padding: EdgeInsets.all(0)), //Container(height: 0.0),
                icon: Icon(
                  SystemIconsIS.is24_system_48px_search,
                  size: 24, //MediaQuery.of(context).size.width * 0.09,
                  color: colorIcon,
                ),
                activeIcon:
                    new Image.asset("assets/images/search@3x_2.png", height: 26),
              ),
              BottomNavigationBarItem(
                title: Container(height: 0.0),//Padding(padding: EdgeInsets.all(0)),
                //Container(height: 0.0),
                icon: Icon(
                  SystemIconsIS.is24_system_48px_heart_favorite,
                  size: 24, //MediaQuery.of(context).size.width * 0.09,
                  color: colorIcon,
                ),
                activeIcon:
                    new Image.asset("assets/images/heart@3x_2.png", height: 26),
              ),
              BottomNavigationBarItem(
                title: Container(height: 0.0),
                    //Padding(padding: EdgeInsets.all(0)), //
                icon: Icon(
                  SystemIconsIS.is24_system_48px_settings,
                  size: 24, //MediaQuery.of(context).size.width * 0.09,
                  color: colorIcon,
                ),
                activeIcon: new Image.asset("assets/images/settings@3x_2.png",
                    height: 26),
              ),
            ],
          ),
        ),
      //),
    );
  }
}
