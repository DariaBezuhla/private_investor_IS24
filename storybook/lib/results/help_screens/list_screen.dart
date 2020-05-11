import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_8_ball/results/card/real_estate_object.dart';
import 'package:magic_8_ball/results/list/list_with_cards.dart';


import '../../constant.dart';

class ListScreen extends StatelessWidget {

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
              Scaffold(
                backgroundColor: kBackgroundLight,
                body: CustomScrollView(
                  slivers: <Widget>[
                    ListWithCardsSliver(
                      resultsList: results,
                      theme: 'Light',
                    ),
                  ],
                ),
              ),
              Scaffold(
                backgroundColor: dBackgroundColor,
                body: CustomScrollView(
                  slivers: <Widget>[
                    ListWithCardsSliver(
                      resultsList: results,
                      theme: 'Dark',
                    ),
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


/*
  Widget build(BuildContext context) {
    const dBackgroundColor = Color(0xff333333);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/logo.png',
          fit: BoxFit.cover,
          height: 35.0,
        ),
        backgroundColor: Colors.white,
      ),
      body: ScrollListWithCards(
        resultsList: results,
      ),
    );
  }
}

 */