import 'package:flutter/material.dart';
import './constant.dart';

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  double space = 0.0;
  double price = 0.0;
  RangeValues _zimmer = RangeValues(1.0, 6.0);
  var nk;
  var gesamt;

  String nebenkosten(price) {
    nk = (price.toInt() * 19) / 100;
    return nk.toInt().toString();
  }

  String gesamtPrice(price) {
    gesamt = price + nk;
    return gesamt.toInt().toString();
  }

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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 400,
                  height: 200,
                  child: Card(
                    shape: BeveledRectangleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('Kaufpreis ', style: header4),
                                      Tooltip(
                                        message: 'Info about Kaufpreis',
                                        child: Icon(
                                          Icons.info_outline,
                                          color: Color(0xFF848484),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(price.toInt().toString() + ' €',
                                    style: header4),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 5,
                                activeTrackColor: Color(0xff5C5C5C),
                                inactiveTrackColor: kGrey,
                                thumbColor: kTeal,
                                trackShape: CustomTrackShape(),
                                overlayColor: kCharcoal.withOpacity(.2),
                              ),
                              child: Slider(
                                value: price,
                                min: 0,
                                max: 300,
                                onChanged: (double newPrice) {
                                  setState(() {
                                    price = newPrice;
                                  });
                                },
                                label: '$price',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('+ Kaufnebenkosten 19%', style: header4),
                                Text(nebenkosten(price) + ' €', style: header4)
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xff5C5C5C),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Kaufgesamtpreis',
                                  style: TextStyle(
                                    fontFamily: 'MakeItSans',
                                    fontWeight: FontWeight.bold,
                                    color: kCharcoal,
                                    fontSize: 24.0,
                                  ),
                                ),
                                Text(
                                  gesamtPrice(price) + ' €',
                                  style: TextStyle(
                                    fontFamily: 'MakeItSans',
                                    fontWeight: FontWeight.bold,
                                    color: kCharcoal,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 400,
                  height: 100,
                  child: Card(
                    shape: BeveledRectangleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Zimmer ', style: header4),
                                Text(
                                    '${_zimmer.start.round()} bis ${_zimmer.end.round()}',
                                    style: header4)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 5,
                                activeTrackColor: Color(0xff5C5C5C),
                                inactiveTrackColor: kGrey,
                                thumbColor: kTeal,
                                trackShape: CustomTrackShape(),
                                overlayColor: kCharcoal.withOpacity(.2),
                                activeTickMarkColor: Color(0xff5C5C5C),
                                inactiveTickMarkColor: kGrey,
                                valueIndicatorColor: Color(0xff5C5C5C),
                              ),
                              child: RangeSlider(
                                values: _zimmer,
                                min: 1,
                                max: 6,
                                onChanged: (RangeValues zimmer) {
                                  setState(() {
                                    _zimmer = zimmer;
                                  });
                                },
                                divisions: 5,
                                labels: RangeLabels('${_zimmer.start.round()}',
                                    '${_zimmer.end.round()}'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 400,
                  height: 100,
                  child: Card(
                    shape: BeveledRectangleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Größe ', style: header4),
                                Text('ab ${space.round()} m\u00B2',
                                    style: header4),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 5,
                                activeTrackColor: Color(0xff5C5C5C),
                                inactiveTrackColor: kGrey,
                                thumbColor: kTeal,
                                trackShape: CustomTrackShape(),
                                overlayColor: kCharcoal.withOpacity(.2),
                                activeTickMarkColor: Color(0xff5C5C5C),
                                inactiveTickMarkColor: kGrey,
                                valueIndicatorColor: Color(0xff5C5C5C),
                              ),
                              child: Slider(
                                value: space,
                                min: 0,
                                max: 300,
                                onChanged: (double newSpace) {
                                  setState(() {
                                    space = newSpace;
                                  });
                                },
                                divisions: 10,
                                label: '${space.round()}',
                              ),
                            ),
                          ),
                        ],
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
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
