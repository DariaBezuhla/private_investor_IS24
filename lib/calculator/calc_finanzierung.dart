import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'calc_bankrate.dart';


class CalcFinanzierung extends StatefulWidget {
  @override
  _CalcFinanzierungState createState() => _CalcFinanzierungState();
}

double eigenkap = 0.0;
double price = 250.000;
bool isSwitched = false;


String eigenkapital(price) {
  eigenkap = (price.toInt() * 19 / 100);
  return eigenkap.toInt().toString();
}


class _CalcFinanzierungState extends State<CalcFinanzierung> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: elevation,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 1.5,
          margin: EdgeInsets.all(MediaQuery
              .of(context)
              .size
              .height * 0.02),
          child: Column(
            children: <Widget>[

              //FINANZIERUNG and SWITCH
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery
                        .of(context)
                        .size
                        .height * 0.004),
                    child: FlutterSwitch(
                      activeColor: kTeal,
                      toggleSize: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.04,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.15,
                      value: isSwitched,
                      onToggle: (value) {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.04),
                  Text("Finanzierung",
                    style: styleText2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery
                        .of(context)
                        .size
                        .height * 0.004),
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02,
                    ),
                  ),
                ],
              ),


              Visibility(
                visible: isSwitched,
                child: Column(

                    children: <Widget>[


                      SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.025),


                      //GESAMTKAUFPREIS ROW
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Gesamtkaufpreis",
                            style: styleText,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                                .of(context)
                                .size
                                .height * 0.004),
                            child: Icon(
                              SystemIconsIS.is24_system_48px_info,
                              size: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02,
                            ),
                          ),
                          Spacer(),
                          Text('250.000' + ' €',
                              style: styleText),
                        ],
                      ),

                      SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.025),


                      //EIGENKAPITAL ROW
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Eigenkapital",
                            style: styleText,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                                .of(context)
                                .size
                                .height * 0.004),
                            child: Icon(
                              SystemIconsIS.is24_system_48px_info,
                              size: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02,
                            ),
                          ),
                        ],
                      ),


                      //SLIDER
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: MediaQuery
                              .of(context)
                              .size
                              .height * 0.01,
                          activeTrackColor: dSliderColor,
                          inactiveTrackColor: kGrey,
                          thumbColor: kTeal,
                          trackShape: CustomTrackShape(),
                          overlayColor: kCharcoal.withOpacity(.2),
                        ),
                        child: Slider(
                          value: eigenkap,
                          min: 0,
                          max: 250000,
                          onChanged: (double newPrice) {
                            setState(() {
                              eigenkap = newPrice;
                            });
                          },
                          label: '$eigenkap',
                        ),
                      ),


                      //EIGENKAPITAL NUMBERS ROW
                      Row(
                        children: <Widget>[
                          Container(
                            color: Colors.transparent,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.50,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.07,
                            child: Theme(
                              data: new ThemeData(
                                primaryColor: kTeal,
                                primaryColorDark: kTeal,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'z.B. 25%',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x0FFd6d6d6),
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                        color: Color(0x0FFADADAD),
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.014)
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.33,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.07,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(eigenkap.toInt().toString() + " €",
                                style: styleText,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.012),


                      //NETTODARLEHEN ROW
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Nettodarlehen",
                            style: styleText2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                                .of(context)
                                .size
                                .height * 0.004),
                            child: Icon(
                              SystemIconsIS.is24_system_48px_info,
                              size: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02,
                            ),
                          ),
                          Spacer(),
                          Text('115.000' + ' €',
                              style: styleText2),
                        ],
                      ),

                      SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.015),

                      //HORIZONTAL LINE
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery
                            .of(context)
                            .size
                            .height * 0.0),
                        child: Container(
                            child: new SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.001,
                              child: new Center(
                                child: new Container(
                                  margin: new EdgeInsetsDirectional.only(
                                      start: 1.0, end: 1.0),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.001,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                        ),
                      ),

                      SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.020),

                      CalcBankRate(),

                    ]
                ),
              )

            ],
          ),

        )

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