import 'package:flutter/material.dart';
import 'package:storybook/results.dart';

import './buttons.dart';
import './constant.dart';
import './expose.dart';
import './fields.dart';
import './home.dart';
import './kostenrechner.dart';
import './sliders.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'MakeItSans',
            primaryColor: kTeal,
            primaryColorDark: kCharcoal,
            accentColor: kCharcoal),
        home: Storybook(),
      ),
    );

class Storybook extends StatelessWidget {
  FlatButton shelf(
      String name, String file, Widget page, BuildContext context) {
    return FlatButton(
      child: Container(
        width: 200.0,
        height: 100.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage('assets/highlights/$file.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            '$name',
            style: header2,
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    'Storybook',
                    style: header1,
                  ),
                ),
              ),
              Divider(
                indent: 50.0,
                endIndent: 50.0,
                height: 20,
                color: kCharcoal,
              ),
              Text(
                'Different Material Components For PI IS24 App',
                style: TextStyle(fontSize: 15.0, color: kCharcoal),
                textAlign: TextAlign.center,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      shelf('Home', 'fatline', Home(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Buttons', 'circle', Buttons(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Text Fields', 'box', Fields(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Sliders', 'arrow', Sliders(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Results', 'thickline', Results(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Expose', 'circle', Expose(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Offline', 'cross', Others(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
