import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storybook/constant.dart';

class SavedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _showSnack = (context) => Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('Hey sweetheart! Wie geht\'s?')),
            duration: Duration(milliseconds: 1300),
          ),
        );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Saved Items',
          ),
          bottom: TabBar(
            isScrollable: false,
            tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Objekts', style: header4),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: Text('7'),
                    )
                  ],
                ),
              ),
              IgnorePointer(
                child: Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Filters', style: header4),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: Text('2'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
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
                      Builder(
                        builder: (context) => FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          color: kTeal,
                          onPressed: () => _showSnack(context),
                          child: Text(
                            'Start searching',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
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
                      Text('No saved filters', style: header4),
                      SizedBox(
                        height: 20,
                      ),
                      Text('''Check out our latest results for you 
             and save them for later! ''', style: styleText),
                      SizedBox(
                        height: 20,
                      ),
                      Builder(
                        builder: (context) => FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          color: kTeal,
                          onPressed: () => _showSnack(context),
                          child: Text(
                            'Start searching',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
