import 'package:flutter/material.dart';
import 'package:magic_8_ball/icons/system_icons_i_s_icons.dart';

import '../constant.dart';
import '../kostenrechner.dart';

class ExposeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    Widget descriptionSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDescriptionItem('Objektbeschreibung',
              'Bei dem Objekt handelt es sich um einen vollständig sanierten und gepflegten Altbau in zentral innerstädtischer Lage. Die großzügige, in Kürze bezugsfrei werdende Wo … '),
          _buildDescriptionItem('Ausstattung',
              'Bei dem Objekt handelt es sich um einen vollständig sanierten und gepflegten Altbau in zentral innerstädtischer Lage. Die großzügige, in Kürze bezugsfrei werdende Wo … '),
          _buildDescriptionItem('Ort',
              'Zur Beachtung: Die Bilder zeigen eine andere Wohnung in diesem Objekt und Hausteil mit der nahezu identischen Ausstattungsqualität und nahezu identischen räumlichen Aufteilung bzw. Wohnfläche.'),
        ],
      ),
    );

    Widget maps = Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Image.asset(
        "assets/images/maps.png",
      ),
    );

    Widget maps2 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            width: MediaQuery.of(context).size.width - 48,
            height: 75.0,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: new DecorationImage(
                image: AssetImage('assets/images/maps.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );

    Widget contact = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Weitere Fragen zur Immobilie?',
                      style: header4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 24, bottom: 24),
            child: ButtonTheme(
              child: FlatButton(
                color: kTeal,
                textColor: kCharcoal,
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  /*...*/
                },
                child: Text("Anbieter kontaktieren", style: styleButton),
              ),
            ),
          ),
        ],
      ),
    );

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
            KostenrechnerButton(theme: "light"),
            descriptionSection, maps, contact
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

  Column _buildDescriptionItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*2*/
        Container(
          child: Row(
            children: [
              Container(
                color: kTeal,
                width: 5.0,
                height: 28.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 19, top: 14, right: 24, bottom: 10),
                  child: Text(
                    title,
                    style: header4,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 24,
            bottom: 14,
            right: 24,
          ),
          child: Text(
            description,
            style: styleText,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
            child: Divider(color: kLightGrey)),
      ],
    );
  }
}
