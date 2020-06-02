import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:privateinvestorsmobile/icons/product_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/theme.dart';
import 'package:provider/provider.dart';

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
  var nk;
  var gesamt;
  double mn = 0.0;
  double hausgeld = 0.0;
  double ruecklagen = 0.0;
  double hwkosten = 0.0;

  String mieteinahmen(price) {
    mn = (price.toInt() * 19 / 100);
    return mn.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    ThemeData theme = themeProvider.getTheme();

    //var colorIcon = (widget.theme == 'Dark') ? dIconColor : kCharcoal;
    bool isSwitched = false;

    return Container(
      color: theme.backgroundColor,
      child: ListView(
        children: <Widget>[
          //intro
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(left: 24, top: 36, bottom: 12),
                child: Text(
                  'Dein Investment Profil',
                  style: theme.textTheme.headline3,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 12,
                ),
                child: Text(
                  'Für optimiertere Suchergebnisse kannst du hier dein Investment Profil konfigurieren. Damit hilfst du uns, alle Ergebnisse genau auf deine Bedürfnisse abzustimmen.',
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        child: IconTheme(
                          data: theme.primaryIconTheme,
                          child: Icon(
                            ProductIconsIS.is24_product_48px_book_with_euro_sign,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 14, right: 24, bottom: 10),
                          child: Text(
                            'Eigenkapital',
                            style: theme.textTheme.headline4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, top: 14, right: 10, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Maximal",
                          ),
                          Spacer(),
                          Text(mn.toInt().toString() + ' €'),
                        ],
                      ),

                      //SLIDER 1
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: MediaQuery.of(context).size.height * 0.008,
                          activeTrackColor: kTeal,
                          inactiveTrackColor: kGrey,
                          thumbColor: Colors.white,
                          //to do: add Custom Thumbshape with shadow
                          trackShape: CustomTrackShape(),
                          overlayColor: kCharcoal.withOpacity(.2),
                        ),
                        child: Slider(
                          value: mn,
                          min: 0,
                          max: 250000,
                          onChanged: (double newPrice) {
                            setState(() {
                              mn = newPrice;
                            });
                          },
                          label: '$mn',
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.only(
                //       left: 24, top: 14, right: 24, bottom: 10),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Budget bis",
                //         style: styleLabel,
                //       ),
                //       SizedBox(
                //           height: MediaQuery.of(context).size.height * 0.012),
                //       new Theme(
                //         data: new ThemeData(
                //           primaryColor: kGrey,
                //         ),
                //         child: TextFormField(
                //           decoration: InputDecoration(
                //               border: OutlineInputBorder(
                //                 borderSide:
                //                     BorderSide(color: Colors.red, width: 2.0),
                //               ),
                //               labelText: '100.000€',
                //               labelStyle: TextStyle(
                //                   color: kGrey,
                //                   fontSize: MediaQuery.of(context).size.height *
                //                       0.014)),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Container(
                  padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: Divider(color: theme.dividerColor),
                ),
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
                        child: IconTheme(
                          data: theme.primaryIconTheme,
                          child: Icon(
                            ProductIconsIS.is24_product_48px_location,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 14, right: 24, bottom: 10),
                          child: Text(
                            'Ortung',
                            style: theme.textTheme.headline4,
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
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 24),
                        child: FlutterSwitch(
                          activeColor: kTeal,
                          inactiveColor: kGrey,
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
                  padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: Divider(color: theme.dividerColor),
                ),
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
                        child: IconTheme(
                          data: theme.primaryIconTheme,
                          child: Icon(
                            SystemIconsIS.is24_system_48px_rating_state_2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 14, right: 24, bottom: 10),
                          child: Text(
                            'Design',
                            style: theme.textTheme.headline4,
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
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 24),
                        child: FlutterSwitch(
                          activeColor: kTeal,
                          inactiveColor: kGrey,
                          toggleSize: MediaQuery.of(context).size.height * 0.02,
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.width * 0.14,
                          value: isSwitched =
                              themeProvider.getTheme() == dark ? true : false,
                          onToggle: (value) {
                            setState(() {
                              isSwitched = !isSwitched;
                              themeProvider.setTheme(isSwitched ? dark : light);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Divider(color: theme.dividerColor),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),

            // Settings
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Einstellungen",
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Benachrichtigungen",
                          ),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sprachauswahl"),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Feedback zur App"),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: theme.dividerColor),
                ),

                //plus membership
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Plus Mitgliedschaft",
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Du möchtest immer als Erstes von neuen Objekten erfahren und exklusive Beratung? Das und vieles mehr erreichst du durch eine Plus-Mitgliedschaft, die du jetzt einen Monat lang kostenlos testen kannst. ",
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: ButtonTheme(
                          child: FlatButton(
                            color: theme.buttonColor,
                            textColor: kCharcoal,
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 36),
                            onPressed: () {
                              /*...*/
                            },
                            child: Text("Plus freischalten", style: styleButton),
                          ),
                        )),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: theme.dividerColor),
                ),

                //Privacy
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Privacy",
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Impressum"),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Infos zum Tracking"),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Datenschutz"),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Geschäftsbedingungen"),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lizenzhinweise Dritter"),
                          IconTheme(
                            data: theme.iconTheme,
                            child: Icon(
                              SystemIconsIS.is24_system_48px_chevron_right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// https://github.com/flutter/flutter/issues/37057 @clocksmith
class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width * 0.99;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
