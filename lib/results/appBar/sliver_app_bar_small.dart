import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import '../../constant.dart';
import 'filters_app_bar.dart';

class AppBarSliverSmall extends StatelessWidget {
  final String theme;
  final int resultsLength;

  const AppBarSliverSmall({Key key, this.theme, this.resultsLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = (theme == 'Dark') ? dHeaderFooter : kCard;
    var iconColor = (theme == 'Dark') ? dIconColor : kCharcoal;
    var logoApp = (theme == 'Dark') ? dLogo : logo;
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
      floating: true,
      expandedHeight: statusBarHeight,
      backgroundColor: backgroundColor,
      elevation: 2,
    );
  }
}