// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './constant.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _showSnack = (context) => Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('Hey sweetheart! Wie geht\'s?')),
            duration: Duration(milliseconds: 1300),
          ),
        );

    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'MakeItSans',
          primaryColor: kTeal,
          primaryColorDark: kCharcoal,
          accentColor: kCharcoal,
          scaffoldBackgroundColor: kTeal),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Buttons',
                style: header1,
              ),
            ),
            bottom: TabBar(
              isScrollable: false,
              tabs: <Widget>[
                Tab(
                  child: Text('Flat', style: header4),
                ),
                Tab(
                  child: Text('Raised', style: header4),
                ),
                Tab(
                  child: Text('Outline', style: header4),
                ),
                Tab(
                  child: Text('Action', style: header4),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Active:',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      Builder(
                        builder: (context) => FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          color: kTeal,
                          onPressed: () => _showSnack(context),
                          child: Text(
                            'SUCHEN',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Disabled:',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      FlatButton(
                        color: kTeal,
                        onPressed: null,
                        child: Text(
                          'SUCHEN',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Active:',
                        style: header1,
                      ),
                      Builder(
                        builder: (context) => RaisedButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          color: kTeal,
                          onPressed: () => _showSnack(context),
                          child: Text(
                            'SUCHEN',
                            style: header4
                          ),
                        ),
                      ),
                      Text(
                        'Disabled:',
                        style: header1,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        color: kTeal,
                        onPressed: null,
                        child: Text(
                          'SUCHEN',
                          style: header4
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Active:',
                        style: header1
                      ),
                      Builder(
                        builder: (context) => OutlineButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          color: kTeal,
                          onPressed: () => _showSnack(context),
                          child: Text(
                            'SUCHEN',
                            style: header4
                          ),
                        ),
                      ),
                      Text(
                        'Disabled:',
                        style: header1,
                      ),
                      OutlineButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        color: kTeal,
                        onPressed: null,
                        child: Text(
                          'SUCHEN',
                          style: header4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Active Simple:',
                        style: header1,
                      ),
                      Builder(
                        builder: (context) => FloatingActionButton(
                          heroTag: 'btn1',
                          backgroundColor: kTeal,
                          foregroundColor: kCharcoal,
                          onPressed: () => _showSnack(context),
                          child: Icon(Icons.search),
                        ),
                      ),
                      Text(
                        'Disabled:',
                        style: header1,
                      ),
                      FloatingActionButton(
                        heroTag: 'btn2',
                        backgroundColor: kTeal,
                        foregroundColor: kCharcoal,
                        onPressed: null,
                        child: Icon(Icons.search),
                      ),
                      Text(
                        'Active Extended:',
                        style: header1,
                      ),
                      Builder(
                        builder: (context) => FloatingActionButton.extended(
                          heroTag: 'btn3',
                          backgroundColor: kTeal,
                          foregroundColor: kCharcoal,
                          onPressed: () => _showSnack(context),
                          label: Text(
                            'SUCHEN',
                            style: header4,
                          ),
                          icon: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
