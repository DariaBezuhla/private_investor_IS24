import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/home/propertyType_textfield.dart';
import 'package:privateinvestorsmobile/home/textfield_normal.dart';
import 'package:privateinvestorsmobile/home/weitere_filter.dart';
import 'package:privateinvestorsmobile/transition/page_route_generator.dart';
import '../constant.dart';
import '../results.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auto_complete_location.dart';
import 'location_textfield.dart';

class StarteSuche extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StarteSucheState();
  }
}

class StarteSucheState extends State<StarteSuche> {
  final String containerTitle = 'containerTitle'.tr().toString();
  final String containerDescription = 'containerDescription'.tr().toString();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String currentAddress;
  String geoCode;
  bool userLoc;
  final GlobalKey<NormalTextFieldState> _key = GlobalKey();
  final GlobalKey<LocationInputFieldState> _key2 = GlobalKey();

  //For Filters
  //final GlobalKey<NormalTextFieldState> _key = GlobalKey();
  static int budgetFromUser;
  static String geoCodeFromUser;
  static String estateTypeFromUser;

  //Filters with default value
  static int netYieldFromUser = 0;
  static int priceTrendFromUser = 0;
  static int rentTrendFromUser = 0;
  static int factorFromUser = 100;
  static int pricePerSqFromUser = 1000000;
  static double roomsFromUser = 1;
  static int livingSpaceFromUser = 0;
  static bool refurbishedFromUser = false;
  static bool rentedFromUser = false;
  static bool plausibleFromUser = false;

  //For refreshing filters:
  //  refreshFilter() is called in NormalTextField and other TextFields;
  //  what does: StarteSuchePage.setState() with new filters properties from user
  void refreshFilter() {
    setState(() {
      budgetFromUser = NormalTextFieldState.budget;
      estateTypeFromUser = PropertyTypeTextFieldState.estateType;

      netYieldFromUser = NormalTextFieldState.netYield;
      priceTrendFromUser = NormalTextFieldState.priceTrend;
      rentTrendFromUser = NormalTextFieldState.rentTrend;
      factorFromUser = NormalTextFieldState.factor;
      pricePerSqFromUser = NormalTextFieldState.pricePerSq;
      roomsFromUser = NormalTextFieldState.rooms;
      livingSpaceFromUser = NormalTextFieldState.livingSpace;
      refurbishedFromUser = WeitereFilterDropDownState.pressedSaniert;
      rentedFromUser = WeitereFilterDropDownState.pressedVermietet;
      plausibleFromUser = WeitereFilterDropDownState.pressedPlausible;
    });
  }

  void refreshLocation() {
    geoCodeFromUser = LocationInputFieldState.geoCode;
    if (userLoc) {
      if (geoCodeFromUser == null) {
        geoCodeFromUser = geoCode;
      }
    }
  }

  _getCurrentLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _userlocation = false;
    _userlocation = prefs.getBool('trackUserLocation');
    userLoc = _userlocation;

    if (_userlocation == true) {
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
        currentAddress = '';
      });
    }
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        currentAddress = "${place.locality}";
        AutoCompleteLocationService autoCompleteLocationService =
            AutoCompleteLocationService();
        autoCompleteLocationService
            .fetchAutocompleteLocation(location: currentAddress)
            .then((value) {
          if (value.length > 0) {
            geoCode = value[0].geoId;
            refreshLocation();
          }
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _pageTransition() {
    Navigator.of(context).push(
      PageRouteGenerator(builder: (context) {
        return ResultScreen(
          budget: budgetFromUser,
          estateType: checkEstateType(estateTypeFromUser),
          geoCode: geoCodeFromUser,
          netYield: netYieldFromUser,
          priceTrend: priceTrendFromUser,
          rentTrend: rentTrendFromUser,
          factor: factorFromUser,
          pricePerSqm: pricePerSqFromUser,
          rooms: roomsFromUser,
          livingSpace: livingSpaceFromUser,
          refurbished: refurbishedFromUser,
          rented: rentedFromUser,
          plausible: plausibleFromUser,
        );
      }),
    );
  }

  _goToResultsList() {
    if (userLoc) {
      if (_key.currentState.validateInput()) {
        _pageTransition();
      }
    } else {
      _key.currentState.validateInput();
      _key2.currentState.validateInput();
      if (_key.currentState.validateInput() &&
          _key2.currentState.validateInput()) {
        _pageTransition();
      }
    }
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
                            key: _key2,
                            textFieldValue: 'Wo: Bezirk, Stadt oder Bundesland'
                                .tr()
                                .toString(),
                            topValue: 'Region'.tr().toString(),
                            location: currentAddress,
                            function: refreshLocation,
                          ),
                        ),

                        SizedBox(height: ScreenUtil().setHeight(10)),

                        //2. TEXTFIELD
                        Theme(
                            data: new ThemeData(
                              primaryColor: kTeal,
                              primaryColorDark: kTeal,
                            ),
                            child: new PropertyTypeTextField(
                              topValue: "Art".tr().toString(),
                              customHead: (String str) {
                                print(str);
                              },
                              function: refreshFilter,
                            )),

                        SizedBox(height: ScreenUtil().setHeight(10)),

                        //3. TEXTFIELD
                        Theme(
                          data: new ThemeData(
                            primaryColor: kTeal,
                            primaryColorDark: kTeal,
                          ),
                          child: new NormalTextField(
                            key: _key,
                            topNormalValue: "Budget bis".tr().toString(),
                            customHead: (String str) {
                              print(str);
                            },
                            normalFieldValue: "100.000€".tr().toString(),
                            customWert: (String st) {
                              //print(st);
                            },
                            function: refreshFilter,
                            filterName: 'budget',
                          ),
                        ),

                        SizedBox(height: ScreenUtil().setHeight(10)),

                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10)),
                          child: Divider(color: kLightGrey),
                        ),

                        WeitereFilter(
                          function: refreshFilter,
                        ),

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
                            onPressed: _goToResultsList,
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

String checkEstateType(String typeFromUser) {
  switch (typeFromUser) {
    case 'Alles':
      {
        return 'BOTH';
      }
      break;
    case 'Everything':
      {
        return 'BOTH';
      }
      break;
    case 'Neubau':
      {
        return 'NEW_HOME';
      }
      break;
    case 'New building':
      {
        return 'NEW_HOME';
      }
      break;
    case 'Wohnung':
      {
        return 'APARTMENT_BUY';
      }
      break;
    case 'Apartment':
      {
        return 'APARTMENT_BUY';
      }
      break;
    case 'Haus':
      {
        return 'HOUSE_BUY';
      }
    case 'House':
      {
        return 'HOUSE_BUY';
      }
      break;
    default:
      {
        return 'BOTH';
      }
      break;
  }
}
