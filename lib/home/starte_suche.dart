import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/textfield_normal.dart';
import 'package:privateinvestorsmobile/home/weitere_filter.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../constant.dart';
import '../results.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'location_textfield.dart';

class StarteSuche extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StarteSuchePage();
  }
}

class _StarteSuchePage extends State<StarteSuche> {
  final String containerTitle = 'containerTitle'.tr().toString();

  final String containerDescription = 'containerDescription'.tr().toString();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  _getCurrentLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic _userlocation = prefs.getBool('location');

    if (_userlocation is bool && _userlocation == true) {
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
        _getAddressFromLatLng();
      }).catchError((e) {
        print(e);
      });
    } else {
      setState(() {
        _currentAddress = '';
      });
    }
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.locality}";
      });
      print(_currentAddress);
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: new EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setHeight(48)),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //HEADLINE
                  AutoSizeText('Kapitalanlagen in Deutschland'.tr().toString(),
                      maxLines: 1,
                      minFontSize: header5.fontSize,
                      style: CustomStyle.headerDarkGrey(context)),

                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),

                  //SUB HEADLINE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText('Der'.tr().toString(),
                          minFontSize: dStyleDescriptionText.fontSize,
                          maxFontSize: styleText.fontSize,
                          style: CustomStyle.styleText(context)),
                      AutoSizeText('Marktführer'.tr().toString(),
                          minFontSize: dStyleDescriptionText.fontSize,
                          maxFontSize: styleTextHighlight.fontSize,
                          style: CustomStyle.styleTextHighlight(context)),
                      AutoSizeText(
                          'Die Nr. 1 rund um Immobilien'.tr().toString(),
                          minFontSize: dStyleDescriptionText.fontSize,
                          maxFontSize: styleText.fontSize,
                          style: CustomStyle.styleText(context)),
                    ],
                  ),
                ]),
          ),
          Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  color: Colors.white,
                  elevation: 2.0,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(24),
                        vertical: ScreenUtil().setHeight(24)),
                    //MAIN CONTAINER
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          containerTitle,
                          style: CustomStyle.header1(context),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Text(
                          containerDescription,
                          style: CustomStyle.styleBigText(context),
                        ),

                        SizedBox(
                          height: ScreenUtil().setHeight(24),
                        ),

                        //1. TEXTFIELD
                        Theme(
                          data: new ThemeData(
                            primaryColor: kTeal,
                            primaryColorDark: kTeal,
                          ),
                          child: new LocationTextField(
                            textFieldValue: 'Wo: Bezirk, Stadt oder Bundesland'
                                .tr()
                                .toString(),
                            topValue: 'Region'.tr().toString(),
                            location: _currentAddress,
                          ),
                        ),

                        SizedBox(height: ScreenUtil().setHeight(10)),

                        //2. TEXTFIELD
                        Theme(
                          data: new ThemeData(
                            primaryColor: kTeal,
                            primaryColorDark: kTeal,
                          ),
                          /*child: new HomeTextField(
                              "Realestate", (String str){print(str);},"Wohnung", (String st){print(st);}
                          ),*/
                          child: new NormalTextField(
                              "Realestate".tr().toString(),
                              (String str) {
                                print(str);
                              },
                              "Wohnung".tr().toString(),
                              (String st) {
                                print(st);
                              }),
                        ),

                        SizedBox(height: ScreenUtil().setHeight(10)),

                        //3. TEXTFIELD
                        Theme(
                          data: new ThemeData(
                            primaryColor: kTeal,
                            primaryColorDark: kTeal,
                          ),
                          child: new NormalTextField(
                              "Budget bis".tr().toString(),
                              (String str) {
                                print(str);
                              },
                              "100.000€".tr().toString(),
                              (String st) {
                                print(st);
                              }),
                        ),

                        SizedBox(height: ScreenUtil().setHeight(10)),

                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10)),
                          child: Divider(color: kLightGrey),
                        ),

                        WeitereFilter(),

                        SizedBox(height: ScreenUtil().setHeight(10)),

                        //SUCHEN BUTTON
                        new ButtonTheme(
                          minWidth: double.infinity,
                          child: FlatButton(
                            color: kTeal,
                            textColor: kCharcoal,
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(10),
                                horizontal: ScreenUtil().setWidth(10)),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteGenerator(builder: (context) {
                                  return ResultScreen();
                                }),
                              );
                            },
                            child: Text('Suchen'.tr().toString(),
                                style: CustomStyle.styleButton(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
