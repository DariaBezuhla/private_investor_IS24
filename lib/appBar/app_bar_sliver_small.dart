import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../constant.dart';
import '../results.dart';

//AppBarSliverSmall for Wishlist -> IMPORTANT:  iconArrowLeft.onPressed: () return ResultScreen();
//Otherwise we can have vicious circle Wishlist <-> Expose
class AppBarSliverSmall extends StatelessWidget {
  const AppBarSliverSmall({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = 56; //<-- NOT ScreenUtil().setWidth(24), It must be const 56.0

    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: ScreenUtil().setWidth(24),
          color: kCharcoal,
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteGenerator(builder: (context) {
              return ResultScreen();
            }),
          );
        });


    return SliverAppBar(
      leading: iconArrowLeft,
      title: Center(child: logo),
      actions: <Widget>[
        Container(
            width: 56,
           ),
      ],
      pinned: false,
      floating: true,
      expandedHeight: statusBarHeight,
      backgroundColor: kHeaderFooter,
      elevation: elevation,
    );
  }
}