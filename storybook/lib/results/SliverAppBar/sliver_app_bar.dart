import 'package:flutter/material.dart';
import 'package:storybook/icons/system_icons_i_s_icons.dart';


import '../../constant.dart';
import 'filters_app_bar.dart';


class AppBarSliver extends StatelessWidget {
  final bool _filterOpen = true;
  final String theme;
  final int resultsLength;

  const AppBarSliver({Key key, this.theme, this.resultsLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = (theme == 'Dark') ? dHeaderFooter : kCard;
    var iconColor = (theme == 'Dark') ? dIconColor : null;
    var logoApp = (theme == 'Dark') ? dLogo : logo;
    var filterBarHeight = 80.0;
    final double statusBarHeight = 56.0;
    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: 24,
          color: iconColor,
        ),
        onPressed: () {
          Navigator.maybePop(context);
        });

    var iconSort = IconButton(
      icon: Icon(
        SystemIconsIS.is24_system_48px_rearrange,
        size: 24,
        color: iconColor,
      ),
      onPressed: null,
    );

    return SliverAppBar(
      leading: iconArrowLeft,
      title: logoApp,
      actions: <Widget>[
        iconSort,
      ],
      pinned: false,
      //centerTitle: true,
      //snap: false,
      floating: true,
      //primary: true,
      expandedHeight: filterBarHeight+statusBarHeight,
      //126.0,//_filterOpen ? 200 : 50.0,
      backgroundColor: backgroundColor,
      //forceElevated: true,
      elevation: 2,
      flexibleSpace: FlexibleSpaceBar(
        background: AppBarFilters(
          resultsLength: 2354,//resultsLength,
          theme: theme,
        ),
      ),
    );
  }
}

/* bottom: _filterOpen
          ? PreferredSize(
              preferredSize: Size.fromHeight(56.0),
              child: Container(
                color: kBackgroundLight,
                padding:
                    EdgeInsets.only(bottom: 10, left: 24, right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Spacer(),
                        SearchButton(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Ihre Suche ergab ", style: textColor),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/highlights/Teal_05_Priority-Line_RGB.png',
                              height: 27,
                              width: lineLength,
                              fit: BoxFit.fill,
                            ),
                            Center(
                                child: Text(
                              "${resultsLength}",
                              style: numberColor,
                            )),
                          ],
                        ),
                        Text(" Treffer", style: textColor),
                      ],
                    )
                  ],
                ),
              ),
            )
          : null,
       */