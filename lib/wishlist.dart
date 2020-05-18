import 'package:flutter/material.dart';
import 'bottomBar/bottom_bar.dart';
import 'transition/slederDirection.dart';
import 'icons/system_icons_i_s_icons.dart';
import 'results/card/real_estate_object.dart';
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
          Navigator.of(context).pop(true);
        });

    return Scaffold(
      appBar: AppBar(
        leading: iconArrowLeft,
        title: logo,
        backgroundColor: Colors.white,
      ),
      backgroundColor: kBackgroundLight,
      body: Center(
        child: Text('Wishlist in progress'),
      ),
      bottomNavigationBar: SafeArea(child: BottomBar(selectedIndex: 1)),
    );
  }
}
