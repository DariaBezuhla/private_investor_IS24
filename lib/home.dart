import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'appBar/app_bar_main.dart';
import 'bottomBar/bottom_bar.dart';
import 'home/eigenheim.dart';
import 'home/starte_suche.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

 class _HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBarMain(),
      body: Container(
        color: kBackgroundLight,
        child: Stack(
          children: <Widget>[

            Container(
              child: Image(image: AssetImage('assets/images/ftor_gerade_gradient.jpg')),
            ),
            Container(
              margin: new EdgeInsets.only(top: 130.0),
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: new EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.04,
                      0.0,
                      MediaQuery.of(context).size.width * 0.04,
                      0.0,
                    ),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          StarteSuche(),

                          SizedBox(height: MediaQuery.of(context).size.width * 0.07),

                          Eigenheim(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomBar(selectedIndex: 0, theme: light,),
    );
  }

  }
