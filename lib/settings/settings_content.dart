import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/product_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../constant.dart';

class SettingsContent extends StatefulWidget {
  final String theme;
  const SettingsContent({
    Key key,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _SettingsContentState createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  @override
  Widget build(BuildContext context) {
    var colorIcon = (widget.theme == 'Dark') ? dIconColor : kCharcoal;
    bool isSwitched = false;

    return ListView(
      children: <Widget>[
        //intro
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(left: 24, top: 36, bottom: 14),
              child: Text(
                'Dein Investment Profil',
                style: header3,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24,
                bottom: 14,
              ),
              child: Text(
                'Für optimiertere Suchergebnisse kannst du hier dein Investment Profil konfigurieren. Damit hilfst du uns, alle Ergebnisse genau auf deine Bedürfnisse abzustimmen.',
                style: styleText,
              ),
            ),
          ],
        ),

        //eigenkapital
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 24, top: 14, right: 10, bottom: 10),
                      child: Icon(
                        ProductIconsIS.is24_product_48px_book_with_euro_sign,
                        size: 30, //MediaQuery.of(context).size.width * 0.09,
                        color: colorIcon,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 14, right: 24, bottom: 10),
                        child: Text(
                          'Eigenkapital',
                          style: header4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 24, top: 14, right: 24, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Budget bis",
                      style: styleLabel,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012),
                    new Theme(
                      data: new ThemeData(
                        primaryColor: kLightGrey,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                            ),
                            labelText: '100.000€',
                            labelStyle: TextStyle(
                                color: kLightGrey,
                                fontSize: MediaQuery.of(context).size.height *
                                    0.014)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: Divider(color: kLightGrey)),
            ],
          ),
        ),

        //location
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 24, top: 14, right: 10, bottom: 10),
                      child: Icon(
                        ProductIconsIS.is24_product_48px_location,
                        size: 30, //MediaQuery.of(context).size.width * 0.09,
                        color: colorIcon,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 14, right: 24, bottom: 10),
                        child: Text(
                          'Ortung',
                          style: header4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 24, top: 14, bottom: 10),
                        child: Text(
                          'Geo-Location verwenden',
                          style: styleText,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 24),
                      child: FlutterSwitch(
                        activeColor: kTeal,
                        toggleSize: MediaQuery.of(context).size.height * 0.02,
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.14,
                        value: isSwitched,
                        onToggle: (value) {
                          setState(() {
                            isSwitched = !isSwitched;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: Divider(color: kLightGrey)),
            ],
          ),
        ),

        //appearance
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 24, top: 14, right: 10, bottom: 10),
                      child: Icon(
                        SystemIconsIS.is24_system_48px_rating_state_2,
                        size: 30, //MediaQuery.of(context).size.width * 0.09,
                        color: colorIcon,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 14, right: 24, bottom: 10),
                        child: Text(
                          'Design',
                          style: header4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 24, top: 14, bottom: 10),
                        child: Text(
                          'Dark-Theme',
                          style: styleText,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 24),
                      child: FlutterSwitch(
                        activeColor: kTeal,
                        toggleSize: MediaQuery.of(context).size.height * 0.02,
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.14,
                        value: isSwitched,
                        onToggle: (value) {
                          setState(() {
                            isSwitched = !isSwitched;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: Divider(color: kLightGrey)),
            ],
          ),
        )
      ],
    );
  }
}
