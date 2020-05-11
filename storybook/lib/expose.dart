import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_8_ball/expose/expose_screen_bottom.dart';
import 'package:magic_8_ball/expose/expose_screen_top.dart';
import 'package:magic_8_ball/sliders.dart';

import 'constant.dart';
import 'expose/expose_screen.dart';

class Expose extends StatelessWidget {
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
          child: ListView(
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
                      shelf('Image Slider', 'arrow', Sliders(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Top Part', 'box', ExposeScreenTop(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: <Widget>[
                      shelf(
                          'Bottom Part', 'box', ExposeScreenBottom(), context),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: <Widget>[
                      shelf('Full Page', 'box', ExposeScreen(), context),
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
