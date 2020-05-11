import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:storybook/icons/system_icons_i_s_icons.dart';
import 'package:storybook/kostenrechner.dart';

import './../constant.dart';

class ExposeScreenTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundLight,
      body: Container(
        child: ListView(
          children: <Widget>[
            //Image -> later Image Slider
            Image.asset(
              "assets/objects/1.png",
            ),

            //intro info
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                transform: Matrix4.translationValues(0, -25.0, 0),
                decoration: BoxDecoration(
                  boxShadow: shadowMd,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  //color: Colors.white,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "1-Zi-Etagenwohnung im Herzen von Schöneberg mit Balkon",
                        style: header4,
                      ),
                      Text(
                        "13587 Berlin, Spandau (Spandau)",
                        style: styleText,
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),

            //4 most important numbers
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _buildInfoItem1("Kaufpreis", "745,900 €"),
                      _buildInfoItem1("Aktuelle Miete", "1500 €")
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _buildInfoItem1("Preis pro m²", "5,187 €/m²"),
                      _buildInfoItem1("Hausgeld", "400 €")
                    ],
                  ),
                ],
              ),
            ),

            //rest of numbers
            Container(
              decoration: BoxDecoration(
                  boxShadow: shadowMd,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Container(
                padding: EdgeInsets.all(15),
                //color: Colors.white,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: kBackground))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildInfoItem1("Nettorendite", "2.7 %"),
                          _buildInfoItem1("Gesch. Kaltmiete", "730 €"),
                          _buildInfoItem1("X-fache Miete", "29")
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: kBackground),
                            ),
                          ),
                          child: _buildInfoItem2(
                              "Mietpreis-\nentwicklung", "10.3 %", true),
                        ),
                        _buildInfoItem2(
                            "Kaufpreis-\nentwicklung", "2.4 %", false)
                      ],
                    )
                  ],
                ),
              ),
            ),

            //props
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceEvenly,
                  children: _buildInfoItem3([
                    "34m²",
                    "1 Zimmer",
                    "Aufzug",
                  ])),
            ),
            //calculator button
            KostenrechnerButton(theme: "light")
          ],
        ),
      ),
    );
  }

  Container _buildInfoItem1(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          Text(
            value,
            style: header4,
          ),
          Text(
            title,
            style: styleDescriptionText,
          )
        ],
      ),
    );
  }

  Container _buildInfoItem2(String title, String value, bool isPositive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 5),
              decoration: new BoxDecoration(
                  color: isPositive ? Colors.green[100] : Colors.red[100],
                  shape: BoxShape.circle),
              child: Icon(
                isPositive
                    ? SystemIconsIS.is24_system_48px_arrow_up
                    : SystemIconsIS.is24_system_48px_arrow_down,
                color: isPositive ? Colors.green[700] : Colors.red[700],
                size: 20,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                value,
                style: header4,
              ),
              Wrap(
                children: <Widget>[
                  Text(
                    title,
                    style: styleDescriptionText,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInfoItem3(List<String> list) {
    return list
        .map(
          (e) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              e,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        )
        .toList();
  }
}
