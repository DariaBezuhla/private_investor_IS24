// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LI
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:storybook/results/card/real_estate_object.dart';
import 'package:storybook/results/help_screens/app_bar_screen.dart';
import 'package:storybook/results/help_screens/card_screen.dart';
import 'package:storybook/results/help_screens/page_screen.dart';
import 'package:storybook/results/help_screens/list_screen.dart';
import 'package:storybook/results/wish_list/saved_items.dart';


import 'constant.dart';

class Results extends StatelessWidget {
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
            style: header1,
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
            )),
        title: Image.asset(
          'assets/logo/logo.png',
          fit: BoxFit.cover,
          height: 35.0,
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Divider(
                indent: 50.0,
                endIndent: 50.0,
                height: 20,
                color: kCharcoal,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      shelf('Card', 'arrow', CardScreen(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('List', 'arrow', ListScreen(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('App Bar', 'arrow', SliverAppBarScreen(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Page light', 'box', ResultScreen(theme: 'Light', resultsList: results,), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Page dark', 'thickline', ResultScreen(theme: 'Dark',resultsList: results,), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Saved Items', 'circle', SavedItems(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
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

