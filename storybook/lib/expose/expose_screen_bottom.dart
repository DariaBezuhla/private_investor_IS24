import 'package:flutter/material.dart';
import '../constant.dart';
import './../constant.dart';

class ExposeScreenBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [descriptionSection, maps, contact],
        ),
      )),
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
