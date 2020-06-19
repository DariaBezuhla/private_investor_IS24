import 'package:flutter/material.dart';
import 'appBar/app_bar_main.dart';
import 'bottomBar/bottom_bar.dart';
import 'home/eigenheim.dart';
import 'home/starte_suche.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './constant.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Flutter plugin for adapting screen and font size.
    //Set the fit size (fill in the screen size of the device in the design)
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 375, height: 667);

    return Scaffold(
      appBar: AppBarMain(),
      body: Container(
        color: kBackgroundLight,
        child: Stack(
          children: <Widget>[
            Container(
              child: Image(image: AssetImage('assets/images/ftor.png')),
            ),
            ListView(
              padding: new EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
              ),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    StarteSuche(),
                    SizedBox(height: ScreenUtil().setHeight(24)),
                    Eigenheim(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 0,
        theme: light,
      ),
    );
  }
}
