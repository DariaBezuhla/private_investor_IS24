import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_8_ball/results/card/real_estate_card.dart';
import 'package:magic_8_ball/results/card/real_estate_object.dart';

import '../../constant.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'MakeItSans',
          primaryColor: Colors.white,
          primaryColorDark: kTeal,
          accentColor: kCharcoal,
          scaffoldBackgroundColor: Colors.white
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back,)
            ),
            title: Image.asset(
              'assets/logo/logo.png',
              fit: BoxFit.cover,
              height: 35.0,
            ),
            bottom: TabBar(
              isScrollable: false,
              tabs: <Widget>[
                Tab(
                  child: Text('Light', style: header4),
                ),
                Tab(
                  child: Text('Dark', style: header4),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  RealEstateCard(
                    house: results[0],
                    theme: 'Light',
                    //onSelected: onSelected,
                    //
                  ),
                  Container (
                    color: Colors.transparent,
                  )
                ],
              ),
              Container(
                color: kCharcoal,
                child: Column(
                  children: <Widget>[
                    RealEstateCard(
                      house: results[0],
                      theme: 'Dark',
                      //onSelected: onSelected,
                    ),
                    Container (
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



/*Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back,)
        ),
        title: Image.asset(
          'assets/logo/logo.png',
          fit: BoxFit.cover,
          height: 35.0,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          RealEstateCard(
            house: results[4],
          ),
          Container (
            color: Colors.transparent,
          )
        ],
      ),
    );
  }
}

       */