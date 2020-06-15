import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:privateinvestorsmobile/constant.dart';
import 'package:privateinvestorsmobile/icons/aditional_icons_i_s_icons.dart';
import 'package:privateinvestorsmobile/icons/system_icons_i_s_icons.dart';
import 'home_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import 'package:easy_localization/easy_localization.dart';

class WeitereFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeitereFilterDropDown();
  }
}

bool _investFilters = false;
bool _immobilieFilters = false;
bool _additionalFilters = false;

var pressedSaniert = false;
var pressedVermietet = false;
var pressedPlausible = false;

class _WeitereFilterDropDown extends State<WeitereFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(

        //MAIN CONTAINER
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      //WEITERE FILTER ROW
      //plus and minus icon
      RawMaterialButton(
        onPressed: showAdditionalFilters,
        constraints: BoxConstraints(),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              (_additionalFilters == false)
                  ? Flexible(
                      child: Icon(
                        SystemIconsIS.is24_system_48px_add,
                        size: ScreenUtil().setHeight(27),
                      ),
                    )
                  : Flexible(
                      child: Icon(
                        AditionalIconsIS.additional_icons_48px_forbidden,
                        color: kCharcoal,
                        size: ScreenUtil().setHeight(27),
                      ),
                    ),
//
              SizedBox(height: ScreenUtil().setHeight(10)),

              //TEXT WEITERE FILTER
              (_additionalFilters == false)
                  ? AutoSizeText(
                      "Weitere Filter".tr().toString(),
                      minFontSize: header5.fontSize, //header5 < header4
                      maxFontSize: header2.fontSize,
                      style: header2,
                    )
                  : AutoSizeText(
                      "Weniger Filter".tr().toString(),
                      minFontSize: header5.fontSize,
                      maxFontSize: header2.fontSize,
                      style: header2,
                    ),

              SizedBox(height: ScreenUtil().setHeight(20)),

              //DOWN/UP ICON
              /*(_additionalFilters == false)
                  ? Flexible(
                      child: Icon(
                        SystemIconsIS.is24_system_48px_chevron_down,
                        size: ScreenUtil().setHeight(27),
                      ),
                    )
                  : Flexible(
                      child: Icon(
                        SystemIconsIS.is24_system_48px_chevron_up,
                        color: kCharcoal,
                        size: ScreenUtil().setHeight(27),
                      ),
                    ),*/
            ]),
      ),

      SizedBox(height: ScreenUtil().setHeight(24)),

      //INVESTITIONEN ROW
      Visibility(
          visible: _additionalFilters,
          child: Column(
            children: <Widget>[
              RawMaterialButton(
                  onPressed: showInvestFilters,
                  constraints: BoxConstraints(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Investitionen'.tr().toString(),
                          style: CustomStyle.header4(context),
                        ),
                        _investFilters
                            ? Icon(
                                SystemIconsIS.is24_system_48px_chevron_up,
                                size: ScreenUtil().setHeight(25),
                              )
                            : Icon(
                                SystemIconsIS.is24_system_48px_chevron_down,
                                size: ScreenUtil().setHeight(25),
                              ),
                      ])),

              SizedBox(height: ScreenUtil().setHeight(5)),

              Container(
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
                child: Divider(color: kLightGrey),
              ),

              SizedBox(height: ScreenUtil().setHeight(10)),

              //INVESTITIONEN OPENED FILTER
              Visibility(
                visible: _investFilters,
                child: Column(children: <Widget>[
                  //5 INPUT FIELDS FOR INVESTITIONEN
                  new HomeTextField(
                      'Nettorendite ab'.tr().toString(),
                      (String str) {
                        print(str);
                      },
                      'z.B. ab 3%'.tr().toString(),
                      (String st) {
                        print(st);
                      }),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  new HomeTextField(
                      'Kaufpreisentwicklung'.tr().toString(),
                      (String str) {
                        print(str);
                      },
                      'z.B. ab 5%'.tr().toString(),
                      (String st) {
                        print(st);
                      }),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  new HomeTextField(
                      'Mietpreisentwicklung'.tr().toString(),
                      (String str) {
                        print(str);
                      },
                      'z.B. ab 5%'.tr().toString(),
                      (String st) {
                        print(st);
                      }),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  new HomeTextField(
                      'Faktor'.tr().toString(),
                      (String str) {
                        print(str);
                      },
                      'z.B. bis 10'.tr().toString(),
                      (String st) {
                        print(st);
                      }),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  new HomeTextField(
                      'Preis pro m2'.tr().toString(),
                      (String str) {
                        print(str);
                      },
                      'z.B. bis 600€'.tr().toString(),
                      (String st) {
                        print(st);
                      }),

                  SizedBox(height: ScreenUtil().setHeight(24)),
                ]),
              ),

              //IMMOBILIE ROW
              Visibility(
                  visible: _additionalFilters,
                  child: Column(children: <Widget>[
                    RawMaterialButton(
                        onPressed: showImmobilieFilters,
                        constraints: BoxConstraints(),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Immobilie'.tr().toString(),
                                style: CustomStyle.header4(context),
                              ),
                              (_immobilieFilters == false)
                                  ? Icon(
                                      SystemIconsIS
                                          .is24_system_48px_chevron_down,
                                      size: ScreenUtil().setHeight(25),
                                    )
                                  : Icon(
                                      SystemIconsIS.is24_system_48px_chevron_up,
                                      color: kCharcoal,
                                      size: ScreenUtil().setHeight(25),
                                    ),
                            ])),
                  ])),

              SizedBox(height: ScreenUtil().setHeight(5)),

              Container(
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
                child: Divider(color: kLightGrey),
              ),

              //IMMOBILIE OPENED FILTERS

              Visibility(
                visible: _immobilieFilters,
                child: Column(
                  children: <Widget>[
                    //2 TEXT FIELDS FOR IMMOBILIE

                    new HomeTextField(
                        'Zimmer'.tr().toString(),
                        (String str) {
                          print(str);
                        },
                        'Zimmer egal'.tr().toString(),
                        (String st) {
                          print(st);
                        }),

                    SizedBox(height: ScreenUtil().setHeight(10)),

                    new HomeTextField(
                        'Größe'.tr().toString(),
                        (String str) {
                          print(str);
                        },
                        'z.B. ab 100 m2'.tr().toString(),
                        (String st) {
                          print(st);
                        }),

                    SizedBox(height: ScreenUtil().setHeight(10)),

                    //3 BUTTONS FOR IMMOBILIE PART
                    new ButtonTheme(
                      minWidth: double.infinity,
                      child: FlatButton(
                        color: pressedSaniert ? kTeal : kBackgroundLight,
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          setState(() {
                            pressedSaniert = !pressedSaniert;
                          });
                        },
                        child: Text('Saniert'.tr().toString(),
                            style:
                                pressedSaniert ? styleButton : disabledButton),
                      ),
                    ),

                    SizedBox(height: ScreenUtil().setHeight(5)),

                    new ButtonTheme(
                      minWidth: double.infinity,
                      child: FlatButton(
                        color: pressedVermietet ? kTeal : kBackgroundLight,
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          setState(() {
                            pressedVermietet = !pressedVermietet;
                          });
                        },
                        child: Text('Vermietet'.tr().toString(),
                            style: pressedVermietet
                                ? styleButton
                                : disabledButton),
                      ),
                    ),

                    SizedBox(height: ScreenUtil().setHeight(5)),

                    new ButtonTheme(
                      minWidth: double.infinity,
                      child: FlatButton(
                        color: pressedPlausible ? kTeal : kBackgroundLight,
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          setState(() {
                            pressedPlausible = !pressedPlausible;
                          });
                        },
                        child: Text('Nur plausibel'.tr().toString(),
                            style: pressedPlausible
                                ? styleButton
                                : disabledButton),
                      ),
                    ),

                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      child: Divider(color: kLightGrey),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                  ],
                ),
              ),
            ],
          )),
    ]));
  }

  void showInvestFilters() {
    setState(() {
      _investFilters = !_investFilters;
    });
  }

  void showImmobilieFilters() {
    setState(() {
      _immobilieFilters = !_immobilieFilters;
    });
  }

  void showAdditionalFilters() {
    setState(() {
      _additionalFilters = !_additionalFilters;
    });
  }
}
