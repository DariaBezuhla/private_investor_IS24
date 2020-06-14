import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';

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
        color: kCard,
        elevation: elevation,
        child: Container(
          width: ScreenUtil().setWidth(470),
          margin: EdgeInsets.all(
            ScreenUtil().setHeight(16),
          ),
          child: Column(
            children: <Widget>[
              //FINANZIERUNG and SWITCH
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setHeight(4)),
                    child: FlutterSwitch(
                      activeColor: kTeal,
                      toggleSize: ScreenUtil().setHeight(17),
                      height: ScreenUtil().setHeight(25),
                      width: ScreenUtil().setWidth(55),
                      value: isSwitched,
                      onToggle: (value) {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(16)),
                  Text(
                    "Finanzierung",
                    style: styleButton,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(4)),
                    child: Icon(
                      SystemIconsIS.is24_system_48px_info,
                      size: ScreenUtil().setWidth(15),
                    ),
                  ),
                ],
              ),

              Visibility(
                visible: isSwitched,
                child: Column(children: <Widget>[
                  SizedBox(height: ScreenUtil().setHeight(16)),

                  //GESAMTKAUFPREIS ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Gesamtkaufpreis",
                        style: styleText,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(4)),
                        child: Icon(
                          SystemIconsIS.is24_system_48px_info,
                          size: ScreenUtil().setWidth(15),
                        ),
                      ),
                      Spacer(),
                      Text('250.000' + ' €', style: styleText),
                    ],
                  ),

                  SizedBox(height: ScreenUtil().setHeight(16)),

                  //EIGENKAPITAL ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Eigenkapital",
                        style: styleText,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(4)),
                        child: Icon(
                          SystemIconsIS.is24_system_48px_info,
                          size: ScreenUtil().setWidth(15),
                        ),
                      ),
                    ],
                  ),

                  //SLIDER
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: ScreenUtil().setHeight(5),
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
                      Flexible(
                        child: Container(
                          color: Colors.transparent,
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(45),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor: kTeal,
                              primaryColorDark: kTeal,
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                  color: kLightGrey,
                                  fontSize: dStyleLabel.fontSize),
                              decoration: InputDecoration(
                                hintText: 'z.B. 25%',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kDivider,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: Colors.transparent,
                          //width: ScreenUtil().setWidth(170),
                          height: ScreenUtil().setHeight(45),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              eigenkap.toInt().toString() + " €",
                              style: styleText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: ScreenUtil().setHeight(16)),

                  //NETTODARLEHEN ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Nettodarlehen",
                        style: styleButton,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(4)),
                        child: Icon(
                          SystemIconsIS.is24_system_48px_info,
                          size: ScreenUtil().setWidth(15),
                        ),
                      ),
                      Spacer(),
                      Text('115.000' + ' €', style: styleButton),
                    ],
                  ),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  //HORIZONTAL LINE
                  Container(
                      child: new SizedBox(
                    height: ScreenUtil().setHeight(1),
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(
                            start: 1.0, end: 1.0),
                        height: ScreenUtil().setHeight(0.5),
                        color: Colors.grey,
                      ),
                    ),
                  )),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  CalcBankRate(),
                ]),
              )
            ],
          ),
        ));
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
