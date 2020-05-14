import 'package:flutter/material.dart';


import './constant.dart';
import 'icons/product_icons_i_s_icons.dart';

final String assetName = 'assets/icons/calculator.svg';

class Others extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'MakeItSans',
          primaryColor: kTeal,
          primaryColorDark: kCharcoal,
          accentColor: kCharcoal),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KostenrechnerButton(
                  theme: "light",
                ),
                KostenrechnerButton(
                  theme: "dark",
                ),
                OfflineButton(
                  theme: "light",
                ),
                OfflineButton(
                  theme: "dark",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KostenrechnerButton extends StatefulWidget {
  final String theme;

  const KostenrechnerButton({Key key, this.theme}) : super(key: key);

  @override
  _KostenrechnerState createState() => _KostenrechnerState();
}

class _KostenrechnerState extends State<KostenrechnerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Card(
          color: kTeal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: widget.theme == "light" ? Colors.white : kCharcoal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        ProductIconsIS.is24_product_48px_calculator,
                        color: kGrey,
                        size: 24.0,
                      ),
                      //is24_product_48px_calculator
                      /*SvgPicture.asset(assetName,
                          semanticsLabel: 'Calculator', color: kGrey),

                       */
                      Text(
                        '''Welche Kosten könnten mich als
Investor erwarten ?''',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: widget.theme == "light" ? kCharcoal : kGrey),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Zum Kostenrechner', style: styleButton),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )),
    );
  }
}

class OfflineButton extends StatefulWidget {
  final String theme;

  const OfflineButton({Key key, this.theme}) : super(key: key);

  @override
  _OfflineButtonState createState() => _OfflineButtonState();
}

class _OfflineButtonState extends State<OfflineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      child: Card(
        color: widget.theme == "light" ? Colors.white : kCharcoal,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.cloud_off, size: 50, color: kGrey),
                  Text(
                    '''You\'re offline.
Your network is unavailable.''',
                    style: TextStyle(
                        fontSize: 20,
                        color: widget.theme == "light" ? kCharcoal : kGrey),
                  )
                ],
              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Retry', style: TextStyle(fontSize: 20)),
                    onPressed: () {},
                    color: kTeal)
              ],
            )
          ],
        ),
      ),
    );
  }
}
