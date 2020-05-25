import 'package:flutter/material.dart';
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
      appBar: AppBar(

        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/immoscout_logo.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ],
        ),
      ),


      body: Container(
        color: Colors.white,
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
            ListView(
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
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: BottomBar(selectedIndex: 0),),
    );
  }

  }
