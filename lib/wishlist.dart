import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/results.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import 'package:privateinvestorsmobile/wishlist/wishlist_list.dart';
import 'appBar/app_bar_sliver_small.dart';
import 'bottomBar/bottom_bar.dart';
import 'icons/system_icons_i_s_icons.dart';
import './constant.dart';

class WishlistScreen extends StatefulWidget {
  final int selectedIndex;

  const WishlistScreen({
    Key key,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    var iconArrowLeft = IconButton(
        icon: Icon(
          SystemIconsIS.is24_system_48px_chevron_left,
          size: 24,
          color: kCharcoal,
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteGenerator(builder: (context) {
              //We don't need pop, becouse pop go to expose
              return ResultScreen();
            }),
          );
        });


    var iconSort = IconButton(
      icon: Icon(
        SystemIconsIS.is24_system_48px_rearrange,
        size: 24,
        color: kIcon,
      ),
      onPressed: null,
    );

    var appBar = SliverAppBar(
      leading: iconArrowLeft,
      title: logo,
      actions: <Widget>[
        iconSort,
      ],
      pinned: false,
      floating: true,
      expandedHeight: 56.0,
      backgroundColor: kHeaderFooter,
      elevation: 2,
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kBackgroundLight,
          child: CustomScrollView(
            slivers: <Widget>[
              AppBarSliverSmall(),
              Wishlist(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(selectedIndex: 1, theme: light,),
    );
  }
}