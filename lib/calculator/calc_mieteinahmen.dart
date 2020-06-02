//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';

class CalcMieteinahmen extends StatefulWidget {
  @override
  _CalcMieteinahmenState createState() => _CalcMieteinahmenState();
}

class _CalcMieteinahmenState extends State<CalcMieteinahmen> {

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

  String gesamtPrice(price) {
    gesamt = price + mn;
    return gesamt.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCard,
      elevation: elevation,
      child: Container(
        width: MediaQuery.of(context).size.width * 1.5,
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(
          children: <Widget>[

            //KAUFPREIS ROW
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Mieteinahmen",
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Spacer(),
                Text(mn.toInt().toString() + ' €',
                    style: styleText),
              ],
            ),

            //SLIDER 1
            SliderTheme(
              data: SliderThemeData(
                trackHeight: MediaQuery.of(context).size.height * 0.01,
                activeTrackColor: dSliderColor,
                inactiveTrackColor: kGrey,
                thumbColor: kTeal,
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


            //THREE TEXT FIELDS
            // 1 - "Nicht umlagefähiges Hausgeld + Icon"
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Nicht umlagefähiges Hausgeld",
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.012),

            //1. TEXT FIELD
            Row(
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Theme(
                      data: new ThemeData(
                        primaryColor: kTeal,
                        primaryColorDark: kTeal,
                      ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x0FFd6d6d6),
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: Color(0x0FFADADAD),
                              fontSize: MediaQuery.of(context).size.height * 0.014)
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.17,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(hausgeld.toInt().toString() + " €",
                      style: styleText,
                    ),
                  ),
                ),
            ],
          ),

            SizedBox(
                height: MediaQuery.of(context).size.height * 0.012),

            //2. TEXT FIELD
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Rücklagen für Mietausfall",
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.012),

            Row(
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: kTeal,
                      primaryColorDark: kTeal,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x0FFd6d6d6),
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: Color(0x0FFADADAD),
                              fontSize: MediaQuery.of(context).size.height * 0.014)
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.17,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(ruecklagen.toInt().toString() + " €",
                      style: styleText,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
                height: MediaQuery.of(context).size.height * 0.012),

            //3. TEXT FIELD
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Handwerkerkosten",
                  style: styleText,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.004),
                  child: Icon(
                    SystemIconsIS.is24_system_48px_info,
                    size: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.012),

            Row(
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: kTeal,
                      primaryColorDark: kTeal,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x0FFd6d6d6),
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: Color(0x0FFADADAD),
                              fontSize: MediaQuery.of(context).size.height * 0.014)
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.17,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(hwkosten.toInt().toString() + " €",
                      style: styleText,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
                height: MediaQuery.of(context).size.height * 0.025),

            //CalcTextField(),
            //CalcTextField(),

            //HORIZONTAL LINE
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.0),
              child: Container(
                  child: new SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.grey,
                      ),
                    ),
                  )
              ),
            ),

            //KAUFGESAMTPREIS ROW
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Betriebskosten',
                    style: header4,
                  ),
                  Text(
                    gesamtPrice(mn) + ' €',
                    style: header4,
                  ),
                ],
              ),
            ),
          ],
        ),
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

