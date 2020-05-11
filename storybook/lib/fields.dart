import 'package:flutter/material.dart';
import './constant.dart';

class Fields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'MakeItSans',
        primaryColor: kCharcoal,
        primaryColorDark: kCharcoal,
        accentColor: kCharcoal,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/highlights/box.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Text Fields',
                      style: header1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: header4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Region',
                      suffixIcon: Icon(Icons.location_searching),
                      helperText: 'Wo: Bezirk, Stadt oder Bundesland',
                      helperStyle: helpers,),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  style: header4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Realestatetype',
                      suffixIcon: Icon(Icons.location_city),
                      helperText: 'Welcher Immobilientype?',
                      helperStyle: helpers,),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  style: header4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Budget bis',
                    suffixIcon: Icon(Icons.euro_symbol),
                    helperText: 'z.B. bis 100.00',
                    helperStyle: helpers,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
