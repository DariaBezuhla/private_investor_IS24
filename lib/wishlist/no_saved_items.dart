import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/home.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';

import '../constant.dart';
import '../results.dart';

class NoSavedItems extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(50),
                child: Image(
                  image: AssetImage(
                    'assets/images/wishlist_light.png',
                  ),
                ),
              ),
              Text('No saved objekts', style: header4),
              SizedBox(
                height: 20,
              ),
              Text('''Check out our latest results for you 
             and save them for later! ''', style: styleText),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:50.0),
                child: Builder(
                  builder: (context) => FlatButton(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    color: kTeal,
                    onPressed: () {
                    Navigator.of(context).push(
                    PageRouteGenerator(builder: (context) {
                    return Home();
                    }),
                    );
                  },
                    child: Text(
                      'Start searching',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
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
